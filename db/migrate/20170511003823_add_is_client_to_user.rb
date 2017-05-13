class AddIsClientToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_client, :boolean, default: true
    # all signed up users will be clients until admin approved
  end
end
