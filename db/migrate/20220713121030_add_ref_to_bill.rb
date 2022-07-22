class AddRefToBill < ActiveRecord::Migration[5.2]
  def change
    add_reference :bills, :card, foreign_key: true
  end
end
