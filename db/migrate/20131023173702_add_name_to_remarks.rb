class AddNameToRemarks < ActiveRecord::Migration
  def change
    add_column :remarks, :name, :string
  end
end
