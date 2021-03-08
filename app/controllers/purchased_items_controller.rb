class PurchasedItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchased_item = PayForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchased_item = PayForm.new(purchased_item_params)
    if @purchased_item.valid?
      pay_item
      @purchased_item.save
      return redirect_to items_path
    else
      render "index"
    end
  end

  private

  def purchased_item_params
    params.require(:pay_form).permit(:postal_code, :prefecture_id, :city, :street_address, :bulding_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchased_item_params[:token],
        currency: 'jpy'
      )
    end

    def move_to_index
      @item = Item.find(params[:item_id])
      if @item.user_id == current_user.id || @item.purchased_item.present?
        redirect_to items_path 
      end
    end

end
