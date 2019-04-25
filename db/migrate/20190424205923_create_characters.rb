class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :english_name
      t.string :japanese_name
      t.string :gender
      t.string :alias
      t.string :show

      t.timestamps
    end
  end
end
