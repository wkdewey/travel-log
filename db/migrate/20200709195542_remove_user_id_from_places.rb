class RemoveUserIdFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :user_id, :integer
  end
end
