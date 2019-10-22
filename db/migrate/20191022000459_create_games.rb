class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :home_team_id
      t.integer :away_team_id
      t.timestamps
    end
  end
end
