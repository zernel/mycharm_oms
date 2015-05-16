class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url, notice: "#{@product} 创建成功。"
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_url, notice: "#{@product} 修改成功。"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "#{@product} 删除成功。"
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category)
  end
end
