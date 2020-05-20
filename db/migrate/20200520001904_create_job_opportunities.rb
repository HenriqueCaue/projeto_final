class CreateJobOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :job_opportunities do |t|
      t.string :title
      t.string :description
      t.string :qualifications
      t.float :salary_range
      t.string :experience_level
      t.date :deadline
      t.string :location
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
