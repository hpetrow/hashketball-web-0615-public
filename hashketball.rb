# Write your code here!

def game_hash
  {
    :home => { :team_name => "Charlotte Hornets",
               :colors => ["Turquoise", "Purple"],
               :players => [
                 {:player_name => "Jeff Adrien",
                  :number => 4,
                  :shoe => 18,
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2
                 },
                 {:player_name => "Bismak Biyombo",
                  :number => 0,
                  :shoe => 16,
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 7,
                  :blocks => 15,
                  :slam_dunks => 10
                 },
                 {:player_name => "DeSagna Diop",
                  :number => 2,
                  :shoe => 14,
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5
                 },
                 {:player_name => "Ben Gordon",
                  :number => 8,
                  :shoe => 15,
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0
                 },
                 {:player_name => "Brendan Haywood",
                  :number => 33,
                  :shoe => 15,
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 22,
                  :blocks => 5,
                  :slam_dunks => 12
                 }
               ]
            },
    :away => { :team_name => "Brooklyn Nets",
               :colors => ["Black", "White"],
               :players => [
                 {:player_name => "Alan Anderson",
                  :number => 0,
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1
                 },
                 {:player_name => "Reggie Evans",
                  :number => 30,
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
                 },
                 {:player_name => "Brook Lopez",
                  :number => 11,
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15
                 },
                 {:player_name => "Mason Plumlee",
                  :number => 1,
                  :shoe => 19,
                  :points => 26,
                  :rebounds => 12,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5
                 },
                 {:player_name => "Jason Terry",
                  :number => 31,
                  :shoe => 15,
                  :points => 19,
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1
                 }
               ]
    }
  }
end

def player_name_key(name)
  name.downcase.gsub(" ", "_").to_sym
end

def num_points_scored(player)
  player_stats(player)[:points]
end

def shoe_size(player)
  player_stats(player)[:shoe]
end

def team_colors(team_name)
  game_hash.collect{ |team, profile|
    profile[:colors] if profile[:team_name] == team_name
  }.flatten.compact
end

def team_names
  game_hash.collect{ |team, profile|
    profile[:team_name]
  }
end

def player_numbers(team_name)
  game_hash.collect { |team, profile|
    if (profile[:team_name] == team_name)
      profile[:players].collect {|player|
        player[:number]
      }
    end
  }.flatten.compact
end

def player_stats(player)
  game_hash.collect { |team, profile|
    profile[:players].select{ |team_player|
      team_player if team_player[:player_name] == player
    }
  }.flatten.first.delete_if {|stat, value| stat == :player_name}
end

def big_shoe_rebounds
  player_rebounds = 0
  largest_shoe_size = 0
  game_hash.each{ |team, profile|
    profile[:players].each { |player|
      if (player[:shoe] > largest_shoe_size)
        largest_shoe_size = player[:shoe]
        player_rebounds = player[:rebounds]
      end
    }
  }
  player_rebounds
end

def most_points_scored
  most_points = 0
  most_points_name = nil
  game_hash.each{ |team, profile|
    profile[:players].each { |player|
      if (player[:points] > most_points)
        most_points = player[:points]
        most_points_name = player[:player_name]
      end
    }
  }
  most_points_name
end

def sum_team_points(team_key)
  points = 0
  game_hash[team_key][:players].each { |player|
    points += player[:points]
  }
  points
end

def winning_team
  home_points = sum_team_points(:home)
  away_points = sum_team_points(:away)
  home_points > away_points ?
    game_hash[:home][:team_name] :
    game_hash[:away][:team_name]
end

def player_with_longest_name
  name_length = 0
  player_name = nil
  game_hash.each{ |team, profile|
    profile[:players].each { |player|
      if (player[:player_name].length > name_length)
        name_length = player[:player_name].length
        player_name = player[:player_name]
      end
    }
  }
  player_name
end

def most_steals
  steals = 0
  name = nil
  game_hash.each{ |team, profile|
    profile[:players].each { |player|
      if (player[:steals] > steals)
        steals = player[:steals]
        name = player[:player_name]
      end
    }
  }
  name
end

def long_name_steals_a_ton?
  player_most_steals = most_steals
  player_longest_name = player_with_longest_name
  player_most_steals == player_longest_name
end
