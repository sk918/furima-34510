class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :delivery_cost_id, :prefecture_id,
                                 :delivery_period_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if @item.user_id != current_user.id || @item.purchased_item.present?
      redirect_to action: :index 
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
