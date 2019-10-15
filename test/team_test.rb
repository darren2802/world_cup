require 'minitest/autorun'
require_relative '../lib/team'
require_relative '../lib/player'


class TestTeam < Minitest::Test

  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_team_instantiated
    assert_instance_of Team, @team
  end

  def test_team_country
    assert_equal "France", @team.country
  end

  def test_team_not_eliminated
    refute @team.eliminated?
  end

  def test_team_eliminated
    @team.eliminate
    assert @team.eliminated
  end

  def test_team_no_players
    assert_equal [], @team.players
  end

  def test_team_add_players
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_team_players_position_midfielder
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end

end
