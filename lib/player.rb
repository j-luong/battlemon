class Player
  DEFAULT_HIT_POINTS = 100
  attr_reader :name
  attr_reader :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def deduct_hp
    @hit_points -= 10
  end
end
