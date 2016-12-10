class User < ApplicationRecord

  has_many :api_keys
  has_many :configurations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :registerable,
  # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :lockable,
         :recoverable, :rememberable, :validatable
end
