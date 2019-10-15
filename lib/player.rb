class Player

  attr_reader :name, :position

  def initialize(init_hash)
    @name = init_hash[:name]
    @position = init_hash[:position]
  end

end
