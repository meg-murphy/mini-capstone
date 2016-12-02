class CartedProductsController < ApplicationController
  def create

    if current_user
      @product = Product.find_by(id: params[:id])
      carted_product = CartedProduct.new(user_id: current_user.id,
                                        quantity: params[:quantity],
                                        product_id: params[:product_id],
                                        status: "carted")
     carted_product.save
     flash[:success] = "Order completed!"
     redirect_to "/checkout"
   else
     flash[:warning] = "You must login first"
     redirect_to "/login"

    end
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:carted_product_id])
    carted_product.assign_attributes(status: "removed")
    carted_product.save

    flash[:warning] = "You removed this product from your cart."
    redirect_to "/checkout"


  end

end
