class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.references :type, index: true
      t.references :item, index: true

      t.timestamps
    end
  end
end
