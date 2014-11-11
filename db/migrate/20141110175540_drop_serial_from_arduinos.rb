class DropSerialFromArduinos < ActiveRecord::Migration
  def up
    remove_column :arduinos, :serial
  end

  def down
    create_column :arduinos, :serial
  end
end
