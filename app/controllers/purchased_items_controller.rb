class PurchasedItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

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
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def purchased_item_params
    params.require(:pay_form).permit(:postal_code, :prefecture_id, :city, :street_address, :bulding_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_00921be9afd09e3b0c4a980d" # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchased_item_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

end
