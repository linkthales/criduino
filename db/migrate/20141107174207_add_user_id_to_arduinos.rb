class AddUserIdToArduinos < ActiveRecord::Migration
  def change
    add_column :arduinos, :user_id, :integer
	add_index :arduinos, :user_id
  end
end
