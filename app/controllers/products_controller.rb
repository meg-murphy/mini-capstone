class ProductsController < ApplicationController

  def products_home
    @page_title = "EVERLANE 2.0"

    @products = Product.all


  end

end
