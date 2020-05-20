class AddReferencesToProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :profiles, :candidate, null: false, foreign_key: true
  end
end
