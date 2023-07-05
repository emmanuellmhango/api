class RemoveImgColumnsFromClaims < ActiveRecord::Migration[7.0]
  def change
    remove_column :claims, :img_one, :string
    remove_column :claims, :img_two, :string
  end
end
