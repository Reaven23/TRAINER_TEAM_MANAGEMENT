class CreateTeamMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :team_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
