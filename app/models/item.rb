class Item < ActiveRecord::Base
	validates :size, inclusion: { in: [0, 2, 4, 6, 8, 10, 12, 14] }
	validates :rating, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }

	has_many :item_tags
	has_many :tags, through: :item_tags
	has_many :item_types
	has_many :types, through: :item_types
	has_many :likes

 	belongs_to :user
end
