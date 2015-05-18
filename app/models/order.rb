class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :takeout_store, class_name: "Store", foreign_key: "takeout_store_id"

  scope :unprocessed, -> { where(state: "unprocessed") }

	validates_presence_of :contact_name, :contact_phone
  
  accepts_nested_attributes_for :order_items, allow_destroy: true

  alias_attribute :to_s, :serial_number

  before_create :set_state

  STATES = ["unprocessed", "processed"]

  def handle
    raise "订单#{serial_number}已经被处理了" unless unprocessed?
    update_column(:state, "processed")
  end

  def serial_number
    "MZ-%.6d" % id 
  end

  def human_state_name
    case state
    when "unprocessed" then "未处理"
    when "processed" then "已处理"
    end
  end

  def unprocessed?
    state == "unprocessed"
  end

  private
  def set_state
    self.state = "unprocessed"
  end
end
