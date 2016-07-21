class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :learning_word
      t.string :meaning
      t.string :meaning_token
      t.references :caterory, foreign_key: true

      t.timestamps
    end
  end
end
