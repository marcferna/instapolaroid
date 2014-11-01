class AddPhotosCountToEvent < ActiveRecord::Migration
  def up
    add_column :events, :photos_count, :integer, default: 0

    Event.select(:id).find_each do |result|
      Event.reset_counters(result.id, :photos)
    end
  end

  def down
    remove_column :events, :photos_count
  end
end
