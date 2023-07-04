class RemoveIconFromClients < ActiveRecord::Migration[7.0]
  def change
    remove_column :clients, :icon, :string
  end
end
