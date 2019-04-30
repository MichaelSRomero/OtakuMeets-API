class RemoveReferenceForTraits < ActiveRecord::Migration[5.2]
  def change
    remove_reference :traits, :personality, index: true, foreign_key: true
  end
end
