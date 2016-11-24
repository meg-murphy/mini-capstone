class ChangeProductIdInImageToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :images, :product_id, "numeric USING product_id::integer"
    change_column :images, :product_id, :integer
  end
end
