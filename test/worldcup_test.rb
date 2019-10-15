require 'minitest/autorun'
require_relative '../lib/worldcup'
require_relative '../lib/team'
require_relative '../lib/player'

require 'pry'

class TestWorldCup < Minitest::Test

  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_worldcup_instantiated
    assert_instance_of WorldCup, @world_cup
  end

  def test_worldcup_year
    assert_equal 2018, @world_cup.year
  end

  def test_worldcup_teams
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_worldcup_active_players_by_position
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")
  end

  def test_worldcup_active_players_by_position_after_elimination
    @croatia.eliminate
    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end

  def test_worldcup_all_players_by_position
    players_by_position = {
      "forward" => [@mbappe],
      "midfielder" => [@pogba, @modric],
      "defender" => [@vida]
    }
    assert_equal players_by_position, @world_cup.all_players_by_position
  end

end
