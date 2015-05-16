class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :takeout_store, class_name: "Store", foreign_key: "takeout_store_id"

	validates_presence_of :contact_name, :contact_phone
  
  accepts_nested_attributes_for :order_items, allow_destroy: true

  alias_attribute :to_s, :serial_number

  STATES = [:new, :processed]
  state_machine initial: :new do
    event :process do
      transition :new => :processed
    end
  end

  def serial_number
    "MZ-%.6d" % id 
  end
end
