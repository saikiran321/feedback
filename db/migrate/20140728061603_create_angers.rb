class CreateAngers < ActiveRecord::Migration
  def change
    create_table :angers do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.integer :anger, null: false

      t.timestamps
    end
    add_index :angers, :user_id
    add_index :angers, :post_id
  end
end
