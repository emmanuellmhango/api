class AddGeocodeToClaims < ActiveRecord::Migration[7.0]
  def change
    add_column :claims, :geocode, :string
  end
end
