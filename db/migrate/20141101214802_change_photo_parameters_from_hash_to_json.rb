class ChangePhotoParametersFromHashToJson < ActiveRecord::Migration
  def up
    change_column :photos, :parameters, 'json USING parameters::JSON'
  end

  def down
    change_column :photos, :parameters, :text
  end
end
