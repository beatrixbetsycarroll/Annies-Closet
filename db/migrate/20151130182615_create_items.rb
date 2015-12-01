class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.string :photo
      t.string :brand
      t.string :description
      t.integer :size
      t.integer :rating

      t.timestamps
    end
  end
end
