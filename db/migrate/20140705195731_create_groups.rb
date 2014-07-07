class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.text :group_description
      t.text :group_logo_url
      t.string :group_tagline

      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end
  end
end
