class AddSigninByToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :signin_by, :string
  end
end
