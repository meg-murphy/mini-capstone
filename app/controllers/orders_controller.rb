class OrdersController < ApplicationController


  def create
    @carted_products = current_user.carted_products.where(status: "carted")
    subtotal = 0
    @carted_products.each do |carted_product|
      subtotal += carted_product.product.price.to_f * carted_product.quantity
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new(user_id: current_user.id,
                       subtotal: subtotal,
                       tax: tax,
                       total: total)

   if @order.save
     @carted_products.each do |carted_product|
       carted_product.assign_attributes(status: "purchased", order_id: @order.id)
       carted_product.save
     end
     flash[:success] = "Purchase complete."
     redirect_to "/orders/#{@order.id}"
   else
     flash[:warning] = "Purchase failed."
     redirect_to "/checkout"
   end
 end

 def show
   @order = Order.find_by(id: params[:id])

     if current_user.id == @order.user_id

     else
       redirect_to "/all_products"
     end
 end

end
