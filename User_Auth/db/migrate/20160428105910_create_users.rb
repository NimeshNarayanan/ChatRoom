class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :id => false do |t|
      t.integer :id
      t.string :username
      t.string :encrypted_password
      t.timestamps null: false
    end
  end
end
