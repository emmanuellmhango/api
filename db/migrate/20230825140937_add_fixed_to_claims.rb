class AddFixedToClaims < ActiveRecord::Migration[7.0]
  def change
    add_column :claims, :fixed, :boolean
  end
end
