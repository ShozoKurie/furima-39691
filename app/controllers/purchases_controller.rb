class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :shut_item_owner, only: [:index, :create]

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
       @purchase_destination.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :region_id, :city, :street_address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def shut_item_owner
    if current_user == @item.user
      redirect_to root_path
    end
  end

end
