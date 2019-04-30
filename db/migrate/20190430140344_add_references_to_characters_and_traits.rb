class AddReferencesToCharactersAndTraits < ActiveRecord::Migration[5.2]
  def change
    add_reference :characters, :personality, foreign_key: true
    add_reference :traits, :personality, foreign_key: true
  end
end
