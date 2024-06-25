class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:order_id,:post_cord,:prefecture_id,:municipalities,:address,:building_name,:phone_number,:token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :order_id
    validates :post_cord,  format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_number, { with: /\A\d{11}\z/, message: 'is invalid' }

    validates :token
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    address = Address.create(order_id: order_id, post_cord: post_cord, prefecture_id: prefecture_id, municipalities: municipalities,address: address,building_name: building_name ,phone_number:phone_number)
  end
end