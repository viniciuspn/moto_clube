class Motorcycle < ApplicationRecord
	belongs_to :name
	#has_many :"id name", through: :name
end
