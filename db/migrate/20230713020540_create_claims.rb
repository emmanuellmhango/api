class CreateClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :claims do |t|
      t.string :comment
      t.string :location
      t.string :forwarded
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
