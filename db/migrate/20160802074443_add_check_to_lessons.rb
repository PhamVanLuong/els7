class AddCheckToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :check, :integer, default: 0
  end
end
