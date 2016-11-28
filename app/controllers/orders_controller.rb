class OrdersController < ApplicationController
  def create
    order = Order.new(user_id: current_user.id,
                    product_id: params[:product_id],
                    quantity: params[:quantity],
                    subtotal: params[:subtotal],
                    tax: params[:tax],
                    total: params[:total])

    if order.save

      flash[:success] = "Added to cart!"
      redirect_to "/all_products"
    else
      flash[:warning] = "Order not completed."
      redirect_to "/all_products"
    end
  end
end
