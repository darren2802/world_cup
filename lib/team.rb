class Team

  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminate
    @eliminated = true
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(input_position)
    @players.find_all { |player| player.position == input_position }
  end

end
