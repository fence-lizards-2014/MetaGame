class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_hash
      t.string :user_email
      t.text :user_bio
      t.integer :user_zipcode

      t.timestamps
    end
  end
end
