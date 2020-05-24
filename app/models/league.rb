class League < ApplicationRecord
  has_many :user_league_rankings
  has_many :users, through: :user_league_rankings

  def self.get_data
    leagues = League.all
    data = []
    leagues.map do |league|
      users = league.users
      user_league_rankings = league.user_league_rankings
      formated_users = []

      # add ranking from user_league_rankings to users array
      # should be cleaned up with a sql join statement on we learn them
      users.each_with_index do |user, index|
        user_ranking = user_league_rankings.find { |x| x[:user_id] == user.id }
        formated_users << { id: user.id, name: user.name, email: user.email }
        formated_users[index][:user_ranking] = user_ranking.position
      end

      data.push({
        league_name: league.name,
        users: formated_users.sort_by { |x| x[:user_ranking] },
        userx: users,
        user_league_rankings: league.user_league_rankings,
      })
    end
    data
  end
end
