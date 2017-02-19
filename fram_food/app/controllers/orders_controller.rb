class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.page(params[:page])
      .per(Settings.order_per).by_date
  end

  def new
    @order = Order.new
  end

  def show
  end

  def create
    if @cart.present?
      @order = Order.new order_params
      if @order.save
        redirect_to order_path @order
      else
        redirect_to new_order_path
      end
    else
      redirect_to carts_path
    end
  end

  private
  def order_params
    params.require(:order).permit :status, :total, :subtotal
  end
end
