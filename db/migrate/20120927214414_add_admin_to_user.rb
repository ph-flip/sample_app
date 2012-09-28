class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :boolean, :admin, default: false
  end
end
