class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :is_approved, :boolean, default: false
  end
end
