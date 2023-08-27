class RenameMembersInYogis < ActiveRecord::Migration[7.0]
  def change
    rename_column :yogis, :member, :member
  end
end
