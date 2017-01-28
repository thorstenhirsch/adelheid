class Property < ApplicationRecord

  belongs_to :application

  # each property (row here) has a column
  # in the deployments table


end
