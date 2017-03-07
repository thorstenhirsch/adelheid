class DeploymentJob < ApplicationJob
  include ApplicationHelper

  queue_as :default
  workers 5

  # OPTIMIZE THIS HEAVILY FOR SPEED!!!
  # this is what will take long when synchronizing

  #TODO: move logic into model! this job is hard to test

  def perform(opts={})
    mongo_id = opts['mongo_id'] || opts[:mongo_id]
    raise 'mongo_id required' unless mongo_id

    doc = DeploymentMongo.find(mongo_id)
    raise "mongo_id not found" if doc.nil?
    puts "DOC: #{doc}" ###

    xml = Nokogiri::XML(doc.to_xml(root: :deployment, skip_instruct: true, indent: 0)) # haven't found a solution without root element
    raise "internal error: couldn't convert bson to xml" if xml.nil?
    puts "XML: #{xml}" ###


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
        # user input -> can fail
        begin
          fixed = fix_xpath(p.xpath) # user's xpath is without /deployment root
          value = xml.xpath(fixed)
          value = value.text() unless value.is_a? String
          puts "searched for #{fixed}, found: #{value}" ###
        rescue => e
          puts "ERROR: dynamic property failed, xpath: #{p.xpath}, fixed: #{fixed}, msg: #{e.message}"
          next
        end
      else
        value = xml.at_xpath("/deployment/#{p.name}").try(:text)
        puts "searched for /deployment/#{p.name} in /#{xml.name}, found: #{value}" ###
      end

      next unless value.present?

      begin
        # assignment with send, the '=' is part of the symbol's name
        deployment.send("#{p.name}=".to_sym, value)
      rescue => e
        puts "ERROR: property #{p.name} found, but deployment has no such attribute, msg: #{e.message}"
      end
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

    # also trigger statistics update
    # -> how many deployments in which environment (_group)
    # -> dployments timeline
  end

  private

  def fix_xpath(xpath)
    # everything that begins with a slash except when a slash is before the slash
    xpath.gsub %r{(?![^/])(/[\w]+)}, '/deployment\1'
    # actually I tried to implement a "lookbehind no slash", (?:[^/])
    # but that didn't work out, it dismissed the char before the / in \1
    # now what seems to work is a negative lookahead, (?![^/])
  end
end
