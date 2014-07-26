class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, null: false
      t.text :title, null: false
      t.text :content, null: false
      t.integer :notifications_count, null: false, default: 0

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
