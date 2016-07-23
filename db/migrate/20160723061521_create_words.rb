class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :learning_word
      t.string :meaning
      t.references :caterory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
