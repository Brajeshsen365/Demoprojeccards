class AddRoleToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :role, :string
  end
end
