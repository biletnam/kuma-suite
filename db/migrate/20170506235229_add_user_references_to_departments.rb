class AddUserReferencesToDepartments < ActiveRecord::Migration[5.0]
  def change
    add_reference :departments, :user, foreign_key: true
  end
end
