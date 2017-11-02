class AddGroupnameToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :groupname, :string
  end
end
