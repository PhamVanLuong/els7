class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.belongs_to :user
      t.belongs_to :lesson

      t.timestamps
    end
  end
end
