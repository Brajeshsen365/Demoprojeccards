class Card < ApplicationRecord
	belongs_to :user
	enum status: [:Credit_card, :Debit_card]

	has_many :bills
end
