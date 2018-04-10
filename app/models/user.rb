class User < ApplicationRecord
	has_many :motorcycles #associar motos um usuário tem varias motos

	def full_name
		"#{self.name} #{self.lastname}"
	end
end
