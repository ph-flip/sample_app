class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :remember_token, :srting
  	addindex   :users, :remember_token
  end
end
