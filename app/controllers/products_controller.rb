class ProductsController < ApplicationController

  def products_home
    @page_title = "EVERLANE 2.0"

    @products = Product.all
  end

  def index
    @page_title = "EVERLANE 2.0"

    @products = Product.all
  end

  def show
    @products = Product.find_by(id: params[:id])
  end

  def new
  end


  def create
    @products = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @products.save
  end

  def edit
    @products = Product.find_by(id: params[:id])
  end

  def update
    products = Product.find_by(id: params[:id])
    products.assign_attributes(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    products.save
  end

end
