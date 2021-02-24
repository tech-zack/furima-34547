
class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index,:create]
  before_action :move_to_index, only: [:index]
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if  @order_address.valid?
      pay_item
       @order_address.save
       return redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:postal_code, :delivery_source_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  Payjp.api_key =  ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.product_price, 
        card: order_params[:token],  
        currency: 'jpy' 
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
    
    def move_to_index
      if current_user == @item.user
      redirect_to root_path
      end
    end


end
