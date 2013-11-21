class AddRecordTimeToBehaviors < ActiveRecord::Migration
  def change
  	add_column :behaviors, :record_time, :datetime
  	add_index :behaviors, :record_time
  end
end
