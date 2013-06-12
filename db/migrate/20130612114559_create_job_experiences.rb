class CreateJobExperiences < ActiveRecord::Migration
  def change
    create_table :job_experiences do |t|
      t.string :company
      t.string :job_title
      t.text :description
      t.date :start_date

      t.timestamps
    end
  end
end
