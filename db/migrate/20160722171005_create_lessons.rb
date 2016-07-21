class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.integer :caterory_user_id
      t.references :caterory, foreign_key: true

      t.timestamps
    end
  end
end
