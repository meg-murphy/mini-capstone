class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  belongs_to :user

  def sale_message
    if price > 2
      return "Discount Item!"
    else
      return "On Sale!"
    end
  end

  def tax
    return price.to_i * 0.09
  end

  def total
    return price.to_i * 0.09 + price.to_i
  end

end
