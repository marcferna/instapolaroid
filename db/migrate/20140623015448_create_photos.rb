class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :event_id
      t.string :photo_id
      t.string :url
      t.string :username
      t.text :parameters

      t.timestamps
    end
  end
end
