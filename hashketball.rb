# Write your code here!

def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        alan_anderson: {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        reggie_evans: {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        brook_lopez: {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        mason_plumlee: {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        jason_terry: {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        jeff_adrien: {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        bismak_biyombo: {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        desagna_diop: {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        ben_gordon: {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        brendan_haywood: {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },
      }
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
      profile[:players].collect { |player, stats|
        stats[:number]
      }
    end
  }.flatten.compact
end

def player_stats(player)
  player_key = player_name_key(player)
  game_hash[:home][:players].has_key?(player_key) ?
    game_hash[:home][:players][player_key] :
    game_hash[:away][:players][player_key]
end

def big_shoe_rebounds
  player_rebounds = 0
  largest_shoe_size = 0
  game_hash.each{ |team, profile|
    profile[:players].each{ |player, stats|
      if (stats[:shoe] > largest_shoe_size)
        largest_shoe_size = stats[:shoe]
        player_rebounds = stats[:rebounds]
      end
    }
  }
  player_rebounds
end