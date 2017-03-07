class DeploymentMongo < ApplicationMongoRecord

  @@collection = $mongo_client[:deployments]
  # or shall we use a class instance variable instead?

  def initialize(data)
    @data = data.to_h
    #@data = @data['deployment'] if @data['deployment']
    # why .to_h? => because:
    # Method to_bson is deprecated and will be removed in Rails 5.1
    # http://stackoverflow.com/questions/38710904/how-do-i-resolve-the-deprecation-warning-method-to-hash-is-deprecated-and-will
  end

  def self.find(id)
    id = BSON::ObjectId(id) unless id.is_a? BSON::ObjectId
    @@collection.find(_id: id).first #TODO: what if multiple? impossible (I think)
  end

  def data
    @data
  end

  def mongo_id
    @mongo_id
  end

  def errors
    [ "some error message" ]
  end

  def save
    result = @@collection.insert_one(@data)
    if result.n < 1
      return false
    else
      @mongo_id = result.inserted_id
    end

    puts "mongo_id: #{@mongo_id}"
    #DeploymentJob.perform_later(mongo_id: @mongo_id)
    DeploymentJob.new.perform(mongo_id: @mongo_id)
  end
end
