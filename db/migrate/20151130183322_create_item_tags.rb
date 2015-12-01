class CreateItemTags < ActiveRecord::Migration
  def change
    create_table :item_tags do |t|
      t.references :tag, index: true
      t.references :item, index: true

      t.timestamps
    end
  end
end
