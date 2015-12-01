class ItemType < ActiveRecord::Base
  belongs_to :type
  belongs_to :item
end
