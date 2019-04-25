class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :preference
      t.string :username
      t.integer :age
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
