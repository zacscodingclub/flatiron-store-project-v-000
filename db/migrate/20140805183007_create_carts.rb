class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.boolean :submitted, default: false

      t.timestamps null: false
    end

    add_index :carts, :user_id
  end
end
