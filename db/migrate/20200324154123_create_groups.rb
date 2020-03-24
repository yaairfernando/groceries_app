class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.integer :creator_id

      t.timestamps
    end
    add_index :groups, :name, unique: true
  end
end
