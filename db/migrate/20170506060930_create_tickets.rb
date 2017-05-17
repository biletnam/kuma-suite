class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|

      t.string :title
      t.string :body
      t.string :department
      t.string :flag
      t.string :status

      t.timestamps
    end
  end
end
