class Configuration < ApplicationRecord

  belongs_to :user, optional: true

  # global config is implemented with class methods
  def self.set(key, value)
    c = find_or_initialize_by(user_id: 0, key: key)
    c.value = value
    c.save!
  end

  def self.get(key)
    c = find_or_initialize_by(user_id: 0, key: key)
    c.value
  end

end
