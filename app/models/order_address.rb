class OrderAddress
include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :delivery_source_id, :city, :address, :building, :phone_number, :token , :order_id

  with_options presence: true do
    validates :city
    validates :address
    validates :item_id
    validates :user_id
    validates :token
    validates :phone_number
    validates :postal_code
  end

    validates :delivery_source_id, numericality: { other_than: 1 } 
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
 

    def save
     order = Order.create(item_id: item_id, user_id: user_id)
     Area.create(postal_code: postal_code, delivery_source_id: delivery_source_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id )
    end
  end