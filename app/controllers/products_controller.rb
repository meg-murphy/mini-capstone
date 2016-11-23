class ProductsController < ApplicationController

  def products_home
    @page_title = "EVERLANE 2.0"
    @products = Product.all
  end

  def index
    @page_title = "EVERLANE 2.0"
    @products = Product.all
    if params[:sort] && params[:sort_order]
      @products = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:discount_price]
      @products = Product.where("#{params[:discount_price]} > ?", 50)
    end
  end

  def show
    if params[:id] == "rando"
      @products = Product.all.order("RANDOM()").first
    else
      @products = Product.find_by(id: params[:id])
    end
  end

  def new
  end

  def create
    @products = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @products.save
    flash[:success] = "New product added!"
    redirect_to "/all_products/#{@products.id}"
  end

  def edit
    @products = Product.find_by(id: params[:id])
  end

  def update
    products = Product.find_by(id: params[:id])
    products.assign_attributes(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    products.save
    flash[:success] = "Product updated!"
    redirect_to "/all_products/#{products.id}"
  end

  def destroy
    @products = Product.find_by(id: params[:id])
    @products.destroy
    @products.save
    flash[:danger] = "Product deleted."
    redirect_to "/all_products"
  end

  def search
    @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
    render :index

  end


end
