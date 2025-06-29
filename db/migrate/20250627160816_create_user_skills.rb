class CreateUserSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :user_skills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
