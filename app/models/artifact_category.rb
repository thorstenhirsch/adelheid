class ArtifactCategory < ApplicationRecord
  has_many :artifact_types
end
