class CreateUserLeagueRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_league_rankings do |t|
      t.integer :position
      t.belongs_to :user, foreign_key: true
      t.belongs_to :league, foreign_key: true

      t.timestamps
    end
  end
end
