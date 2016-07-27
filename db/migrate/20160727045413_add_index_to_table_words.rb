class AddIndexToTableWords < ActiveRecord::Migration
  def change
    add_index :words, [:caterory_id, :created_at]
  end
end
