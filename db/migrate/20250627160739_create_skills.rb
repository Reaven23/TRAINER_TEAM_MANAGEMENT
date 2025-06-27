class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :age_group

      t.timestamps
    end
  end
end
