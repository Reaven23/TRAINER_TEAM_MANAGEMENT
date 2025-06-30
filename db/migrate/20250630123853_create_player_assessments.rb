class CreatePlayerAssessments < ActiveRecord::Migration[7.1]
  def change
    create_table :player_assessments do |t|
      t.references :user, null: false, foreign_key: true
      t.text :key_skills
      t.text :areas_to_improve
      t.text :coach_notes
      t.date :assessment_date

      t.timestamps
    end
  end
end
