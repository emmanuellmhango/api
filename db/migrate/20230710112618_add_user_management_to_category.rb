class AddUserManagementToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user_management, null: false, foreign_key: true
  end
end
