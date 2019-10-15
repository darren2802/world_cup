class WorldCup

  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(input_position)
    all_active_players = @teams.map { |team| team.players unless team.eliminated? }.flatten.compact
    all_active_players.find_all { |player| player.position == input_position }
  end

  def all_players_by_position
    all_players = @teams.map { |team| team.players unless team.eliminated? }.flatten
    all_players.group_by { |player| player.position }
  end

end
