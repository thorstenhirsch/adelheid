class Deployment < ApplicationRecord
  belongs_to :environment
  belongs_to :application
  belongs_to :artifact, optional: true #TODO: check later
  belongs_to :artifact_version, optional: true #TODO: check later

  # this class has custom columns, that are being
  # added (and removed) in the property task
  #
  # - database columns are being generated (and removed)
  #   depending on the user's configuration
  # - since we don't want to restart rails every time we
  #   change the config, we don't generate methods at
  #   rails startup (which is my preferred way otherwise)
  # - instead we use the no_method_found callback

  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end

end
