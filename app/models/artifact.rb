class Artifact < ApplicationRecord
  belongs_to :artifact_type
  belongs_to :artifact_version
  belongs_to :application
end
