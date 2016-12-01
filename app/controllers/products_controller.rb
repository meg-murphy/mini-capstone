class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def products_home
    @page_title = "EVERLANE 2.0"
    @products = Product.all
  end

  def index
    @page_title = "EVERLANE 2.0"

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    else
      @products = Product.all
    end



    if params[:sort] && params[:sort_order]
      @products = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:discount_price]
      @products = Product.where("#{params[:discount_price]} > ?", 50)
    end
  end

  def show
    if params[:id] == "rando"
      @product = Product.all.order("RANDOM()").first
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description])
    @product.save
    @image = Image.new(image_link: params[:image_link], product_id: @product.id)

    flash[:success] = "New product added!"
    redirect_to "/all_products/#{@product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    product.save
    flash[:success] = "Product updated!"
    redirect_to "/all_products/#{product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    @product.save
    flash[:danger] = "Product deleted."
    redirect_to "/all_products"
  end

  def search
    @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
    render :index
  end


end
