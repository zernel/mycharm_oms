需求：
1.新下的单都是未处理，店员检查蛋糕到位后，自己更新为处理
2.下单信息包括：姓名，电话，验证码，蛋糕，磅数，祝福语，取货时间，取货门店，送货信息，备注，
最好是蛋糕能按输入顺序自动排序，也有筛选功能.  最好是蛋糕能按输入顺序自动排序，也有筛选功能.
3.先不设权限，登陆进去谁都可以修改
4.有个自动存储客人信息功能就更棒了
5.今日库存，什么蛋糕，几磅，几个，然后下一个单，自动相应减少

## v0.0.1
+ Admin

+ Store
  * name
  * city
  * address
  * phone

+ Order
  has_many :order_items

  * state
  * name
  * phone
  * verification_code
  * takeout_time
  * takeout_store_id
  * shipping_address
  * note

+ OrderItem
  belongs_to :variant

  * name
  * pound
  * blessing
  * note

## v0.1.0
+ Admin
+ AuditLog
+ Customer
  has_many :orders

  * name
  * phone
  * verification_code

+ Store
  has_many :orders

  * name

+ Order
  has_many :order_items
  belongs_to :customer_id
  belongs_to :store

  * state
  * takeout_time
  * shipping_address
  * note

+ OrderItem
  belongs_to :variant

  * blessing
  * note

+ Product
  has_many :variants

  * name 

+ Variant
  belongs_to :product

  * pound
  * stock
