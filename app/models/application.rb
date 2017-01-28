class Application < ApplicationRecord
  has_many :artifacts
  has_many :deployments
  has_many :properties
end
