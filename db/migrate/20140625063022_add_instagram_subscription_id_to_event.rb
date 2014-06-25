class AddInstagramSubscriptionIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :instagram_subscription_id, :string
  end
end
