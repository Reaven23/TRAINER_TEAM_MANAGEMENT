class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
