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

    doc.extract_to(deployment)

    # finally we've got everything we need
    deployment.save!

    # also trigger statistics update
    # -> how many deployments in which environment (_group)
    # -> dployments timeline
  end
end
