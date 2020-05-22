class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|
      t.string :why_apply
      t.references :job_opportunity, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
