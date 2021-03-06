class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :carted_products
  has_many :orders, through: :carted_products


  def sale_message
    if price > 2
      return "Discount Item!"
    else
      return "On Sale!"
    end
  end


end
