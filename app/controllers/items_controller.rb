class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_item, only:[:edit,:update,:show, :destroy]
  before_action :move_to_index, except: [:index, :show,:new,:create]
  
  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @message = Message.new
    @messages = @item.messages.includes(:user)
  end

  def edit
    
  end

  def update
   
    if @item.update(item_params)
      redirect_to root_path
   else
    render :edit
   end
  end

  def destroy
   
    if @item.destroy
      redirect_to root_path
   end
  end

  private
  def item_params
    params.require(:item).permit(:title,:description,:category_id,:status_id,:delivery_fee_id,:delivery_source_id,:delivery_date_id,:product_price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user != @item.user || @item.order.present?
    redirect_to action: :index
    end
  end

end