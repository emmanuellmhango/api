class CreateUserManagements < ActiveRecord::Migration[7.0]
  def change
    create_table :user_managements do |t|
      t.string :company_name
      t.string :username
      t.string :email
      t.string :phone
      t.string :social_link
      t.string :package

      t.timestamps
    end
  end
end
