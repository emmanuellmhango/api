class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.references :user_management, null: false, foreign_key: { on_delete: :cascade}

      t.timestamps
    end
  end
end
