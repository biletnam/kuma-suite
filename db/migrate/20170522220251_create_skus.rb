class CreateSkus < ActiveRecord::Migration[5.0]
  def change
    create_table :skus do |t|
      t.string :item
      t.float :unit
      t.float :amount
      t.float :total
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
