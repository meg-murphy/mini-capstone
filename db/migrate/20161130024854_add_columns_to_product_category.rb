class AddColumnsToProductCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :product_categories, :product_id, :integer
    add_column :product_categories, :category_id, :integer
  end
end
