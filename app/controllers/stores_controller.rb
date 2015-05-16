class StoresController < ApplicationController
  before_action :set_store, only: [:edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to stores_url, notice: "#{@store} 创建成功。"
    else
      render :new
    end
  end

  def update
    if @store.update(store_params)
      redirect_to stores_url, notice: "#{@store} 修改成功。"
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_url, notice: "#{@store} 删除成功。"
  end

  private
  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :city, :address, :phone)
  end
end
