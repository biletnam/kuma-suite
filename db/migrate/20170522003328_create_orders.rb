class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      # t.string :item
      t.integer :grand_total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
