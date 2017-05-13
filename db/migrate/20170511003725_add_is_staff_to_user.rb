class AddIsStaffToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_staff, :boolean, default: false
    # all signed up users will be clients until admin approved

  end
end
