class Restaurant < ApplicationRecord

	belongs_to :owner
	has_many :reservations
end
