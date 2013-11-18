class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.integer :pos1
      t.integer :neg1
      t.integer :neg2
      t.integer :cor1
      t.string :pos1_name
      t.string :neg1_name
      t.string :neg2_name
      t.string :cor1_name
      t.integer :student_id

      t.timestamps
    end
    add_index :behaviors, :student_id
  end
end
