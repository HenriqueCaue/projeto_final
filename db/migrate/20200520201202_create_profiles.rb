class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :birthday
      t.string :social_name
      t.string :document
      t.string :formation
      t.string :description
      t.string :experience

      t.timestamps
    end
  end
end
