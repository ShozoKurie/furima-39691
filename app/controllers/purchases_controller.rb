class PurchasesController < ApplicationController
  

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end
