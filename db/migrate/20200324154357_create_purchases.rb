class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :name
      t.integer :amount
      t.integer :author_id
      t.integer :group_id

      t.timestamps
    end
    add_index :purchases, :author_id
    add_index :purchases, :group_id
  end
end
