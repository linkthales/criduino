class AddNameToArduinos < ActiveRecord::Migration
  def change
    add_column :arduinos, :name, :string
  end
end
