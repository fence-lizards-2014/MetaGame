class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_game_title
      t.string :event_description
      t.string :event_location
      t.boolean :event_active, default: true
      t.datetime :event_date
      t.integer :event_type_id
      t.integer :event_zipcode
      
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
  end
end
