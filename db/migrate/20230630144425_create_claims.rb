class CreateClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :claims do |t|
      t.string :img_one
      t.string :img_two
      t.string :comment
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
