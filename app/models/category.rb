class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy

  alias_attribute :to_s, :name
end
