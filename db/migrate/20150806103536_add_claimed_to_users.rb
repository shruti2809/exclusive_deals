class AddClaimedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :claimed, :boolean, :default => false
  end
end
