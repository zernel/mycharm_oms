class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :set_tab

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to products_path, notice: "商品种类 #{@category} 创建成功。"
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to products_path, notice: "商品种类 #{@category} 修改成功。"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to products_path, notice: "商品种类 #{@category} 删除成功。"
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def set_tab
    select_tab(:products)
  end
end
