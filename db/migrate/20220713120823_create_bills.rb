class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :username
      t.integer :account_no
      t.integer :cvv
      t.datetime :valid_from
      t.datetime :valid_to
      t.integer :amount

      t.timestamps
    end
  end
end
