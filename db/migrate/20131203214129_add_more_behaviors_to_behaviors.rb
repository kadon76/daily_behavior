class AddMoreBehaviorsToBehaviors < ActiveRecord::Migration
  def change
    add_column :behaviors, :pos2, :integer
    add_column :behaviors, :pos3, :integer
    add_column :behaviors, :pos4, :integer
    add_column :behaviors, :neg3, :integer
    add_column :behaviors, :neg4, :integer
    add_column :behaviors, :neg5, :integer
    add_column :behaviors, :neg6, :integer
    add_column :behaviors, :neg7, :integer
    add_column :behaviors, :neg8, :integer
    add_column :behaviors, :neg9, :integer
    add_column :behaviors, :neg10, :integer
    add_column :behaviors, :neg11, :integer
    add_column :behaviors, :neg12, :integer
    add_column :behaviors, :neg13, :integer
    add_column :behaviors, :neg14, :integer
    add_column :behaviors, :neg15, :integer
    add_column :behaviors, :neg16, :integer
    add_column :behaviors, :cor2, :integer
    add_column :behaviors, :cor3, :integer
    add_column :behaviors, :cor4, :integer
  end
end
