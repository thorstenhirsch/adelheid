class Artifact < ApplicationRecord
  belongs_to :artifact_type
  belongs_to :application

  has_many :artifact_versions
  has_many :deployments
end
