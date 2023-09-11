class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :shut_item_owner, only: [:index, :create]
  before_action :stop_buying_sold_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_destination = PurchaseDestination.new
  end

  def create
    binding.pry
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :region_id, :city, :street_address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def shut_item_owner
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def stop_buying_sold_item
    if @item.purchase
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
