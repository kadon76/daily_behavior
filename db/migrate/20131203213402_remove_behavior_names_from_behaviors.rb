class RemoveBehaviorNamesFromBehaviors < ActiveRecord::Migration
  def change
    remove_column :behaviors, :pos1_name, :string
    remove_column :behaviors, :neg1_name, :string
    remove_column :behaviors, :neg2_name, :string
    remove_column :behaviors, :cor1_name, :string
  end
end
