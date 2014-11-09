class Product < ActiveRecord::Base
	validates :description, :name, presence: true
	validatee :price_in_cents, numerically: {only_integer: true} 
end
