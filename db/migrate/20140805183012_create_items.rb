class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :inventory
      t.decimal :price
      t.integer :category_id

      t.timestamps null: false
    end

    add_index :items, :category_id
  end
end
