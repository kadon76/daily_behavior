class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :student_id
      t.integer :user_id

      t.timestamps
    end
    add_index :students, :user_id
    add_index :students, :student_id, unique: true
  end
end
