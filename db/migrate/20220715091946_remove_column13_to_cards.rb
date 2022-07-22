class RemoveColumn13ToCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :role, :string
  end
end
