class OrderDetailsController < ApplicationController

  before_action :set_order_detail, except: [:new, :index]
  def index
    @order_details = OrderDetail.all
  end

  def new
    @order_detail = OrderDetail.new
  end

  def create
    product = Product.find_by(params[:product_id])
    @order_detail = @order.order_details.build(product: product)

    respond_to do |format|
      if @order_detail.save
        format.html {redirect_to @order_detail.order, notice: "Add successfully"}
      else
        format.html {render action: "new" }
      end
    end
  end

  private
  def set_order_detail
    @order_detail = OrderDetail.find_by id: params[:id]
  end
end
