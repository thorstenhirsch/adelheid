class Deployment < ApplicationRecord
  belongs_to :environment
  belongs_to :artifact
  belongs_to :artifact_version
end
