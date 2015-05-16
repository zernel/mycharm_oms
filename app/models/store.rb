class Store < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
  validates :city, presence: true

  alias_attribute :to_s, :name
end
