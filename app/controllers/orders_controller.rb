class OrdersController < ApplicationController

  def show
    @order = Order.find_by(id: params[:id])

      if current_user.id == @order.user_id

      else
        redirect_to "/all_products"
      end
  end

end
