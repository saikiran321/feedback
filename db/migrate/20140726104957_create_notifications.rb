class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.integer :notif_user
      t.string :action
      t.boolean :seen, default: false

      t.timestamps
    end
  end
  add_index :notifications, :user
end
