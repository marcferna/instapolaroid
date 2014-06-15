class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :hashtag
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
