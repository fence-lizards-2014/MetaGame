class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_steam_id
      t.string :username
      t.string :password_hash
      t.string :user_email
      t.string :user_avatar_url
      t.integer :user_zipcode
      t.text :user_bio

      t.belongs_to :group
      t.belongs_to :event

      t.timestamps
    end
  end
end
