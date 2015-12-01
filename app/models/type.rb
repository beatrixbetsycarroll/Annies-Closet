class Type < ActiveRecord::Base
	validates :category, inclusion: { in: %w(Clothing Shoes Accessories) }

	has_many :item_types
	has_many :items, through: :item_types
end
