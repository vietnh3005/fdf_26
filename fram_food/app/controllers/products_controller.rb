class ProductsController < ApplicationController
  before_action :find_by, only: :show
  def index
    @products = Product.all
  end

  def show
    @comments = @product.comments.order_by_time
  end

  private
  def product_params
    params.require(:product).permit :name, :price, :available, :rate, :image,
      :classify, :category_id
  end

  def find_products
    @product = Product.find_by id: params[:id]
    unless @products
      flash.now[:danger] = t "controllers.users.not_found"
      redirect_to root_path
    end
  end
end
