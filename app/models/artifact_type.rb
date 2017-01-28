class ArtifactType < ApplicationRecord
  belongs_to :artifact_category
  has_many :artifacts
end
