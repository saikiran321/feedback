class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :roll
      t.string :email
      t.string :remember_token
      t.string :password_digest
      t.string :hostel

      t.timestamps
    end
    add_index :users, :roll, unique: true
    add_index :users, :remember_token
  end
end
