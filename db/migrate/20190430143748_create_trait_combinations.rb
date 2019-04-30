class CreateTraitCombinations < ActiveRecord::Migration[5.2]
  def change
    create_table :trait_combinations do |t|
      t.references :personality, foreign_key: true
      t.references :trait, foreign_key: true
      
      t.timestamps
    end
  end
end
