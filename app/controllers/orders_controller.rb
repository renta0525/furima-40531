class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @orderform = OrderForm.new
  end

end
