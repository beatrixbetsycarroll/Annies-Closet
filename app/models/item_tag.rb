class ItemTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :item
end
