class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|

      t.string :title
      t.string :body
      t.string :department
      t.string :rep, default: 'Unassigned'
      t.boolean :flag, default: false
      t.string :status, default: 'Open'

      t.timestamps
    end
  end
end
