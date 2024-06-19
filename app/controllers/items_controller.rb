class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  
  private

  def item_params
  params.require(:item).permit(:image, :item_name, :item_explanation, :category_id, :condition_id, :contribution_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
