class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|

      t.string :title
      t.string :body
      t.string :department
      t.string :rep, default: 'Unassigned'
      t.string :flag
      t.string :status, default: 'open'

      t.timestamps
    end
  end
end
