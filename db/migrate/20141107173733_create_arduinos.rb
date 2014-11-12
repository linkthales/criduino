class CreateArduinos < ActiveRecord::Migration
  def change
    create_table :arduinos do |t|
      t.string :serial
      t.string :mac

      t.timestamps
    end
  end
end
