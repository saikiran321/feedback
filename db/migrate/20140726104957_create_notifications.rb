class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.boolean :seen

      t.timestamps
    end
  end
end
