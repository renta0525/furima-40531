class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      pay_item
      @orderform.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_cord, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_5a47977fab226b968bebd628"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
