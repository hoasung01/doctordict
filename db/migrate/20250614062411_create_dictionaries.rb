class CreateDictionaries < ActiveRecord::Migration[8.0]
  def change
    create_table :dictionaries do |t|
      t.string :word, null: false
      t.string :pronunciation
      t.text :meaning, null: false
      t.string :language, null: false

      t.timestamps
    end

    add_index :dictionaries, :word
    add_index :dictionaries, :language
    add_index :dictionaries, [ :word, :language ], unique: true
  end
end
