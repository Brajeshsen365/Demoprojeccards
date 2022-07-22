class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :username
      t.integer :account_no
      t.integer :cvv
      t.datetime :valid_from
      t.datetime :valid_to

      t.timestamps
    end
  end
end
