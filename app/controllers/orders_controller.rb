class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: "订单#{@order} 创建成功。"
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "订单#{@order} 修改成功。"
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "订单#{@order} 删除成功。"
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :contact_name, :contact_phone, :takeout_time, :takeout_store_id, :shipping_address, :amount, :note, order_items_attributes: [:id, :product_id, :pound, :blessing, :note, :_destroy])
  end
end
