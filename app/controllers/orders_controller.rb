class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  
  def index
    @orderform = OrderForm.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      pay_item
      @orderform.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_cord, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end
