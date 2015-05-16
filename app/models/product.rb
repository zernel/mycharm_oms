class Product < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
  validates :category, presence: true

  alias_attribute :to_s, :name
end
