class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.string :image_url
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
