class RenameAcceptingMembersInStudios < ActiveRecord::Migration[7.0]
  def change
    rename_column :studios, :accepting_members?, :accepting_members
  end
end
