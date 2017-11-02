class RemoveGroupnameFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :groupname, :string
  end
end
