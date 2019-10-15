require 'minitest/autorun'
require_relative '../lib/player.rb'

class TestPlayer < Minitest::Test

  def setup
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  def test_player_instantiated
    assert_instance_of Player, @player
  end

  def test_player_name_luka
    assert_equal "Luka Modric", @player.name
  end

  def test_player_position_luka
    assert_equal "midfielder", @player.position
  end



end
