class DeploymentJob < ApplicationJob
  include ApplicationHelper

  queue_as :default
  workers 5

  def perform(opts={})
    raise 'mongo_id required' unless (opts['mongo_id'] || opts[:mongo_id])

    doc = DeploymentMongo.find(opts['mongo_id'] || opts[:mongo_id]).first #TODO: what if multiple?
    xml = Nokogiri::XML(doc.to_xml(root: :deployment)) # haven't found a solution without root element
    raise "internal error: couldn't convert bson to xml" if xml.nil?

    # now fetch all configured fields from doc
    # 1.) if there's a xpath path expression to fetch it -> use it
    # 2.) look into /
    # 3.) look anywhere
    # this works like an OR expression: (technically: UNION -> Array -> [1], first only)
    # (//bookstore/book/title | //bookstore/city/zipcode/title)[1]
    # note that nokogiri currently supports XPath 1.0 only

    # static / required attributes
    application_name = get_application_name(opts)
    application = Application.find_or_create_by(name: application_name)

    environment_name = xml.at_xpath("/deployment/environment").try(:text) || "unknown"
    environment = Environment.find_or_create_by(name: environment_name)

    deployment = Deployment.new(
      application: application,
      environment: environment
    )

    # dynamic attributes
    Property.where(application: application)
              .each do |p|
      if p.xpath.present?
        xml.root.element_children.each do |c|
          value = c.at_xpath(p.xpath).try(:text) # user's xpath is without /deployment root
          puts "searched for #{p.xpath} in /#{c.name}, found: #{value}" ###
          break if value.present?
        end
      else
        value = xml.at_xpath("/deployment/#{p.name}").try(:text)
        puts "searched for /deployment/#{p.name} in /#{xml.name}, found: #{value}" ###
      end

      # assignment with send, the '=' is part of the symbol's name
      deployment.send("{p.name}=".to_sym, value) unless value.nil?
    end

    # at the end build all fields with a proc
    # -> can use all previously fetched fields
    #proc_fields = [
    #   { name: "Schnittstelle",
    #     number: 10,
    #     proc: "#{srcsysid} / #{msgtype}" }
    #]

    artifacts = xml.xpath("/deployment/artifacts")
    artifacts.each do |a|
      artifact_name = a.xpath("/name").text
      artifact = Artifact.find_or_create_by(name: artifact_name)
      deployment.artifacts << artifact
    end

    # finally we've got everything we need
    deployment.save!

  end
end
