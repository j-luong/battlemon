require_relative 'player'

class Game
  attr_reader :players, :attacker, :victim

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end
  
  def self.instance
    @game
  end

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @attacker = player_1
    @victim = player_2
  end

  def attack(player)
    player.deduct_hp
    change_player
  end

  def change_player
    @victim = @attacker
    @attacker = new_attacker(@attacker)
  end

  def game_over_message
    if @victim.dead?
      "#{@victim.name} loses!"
    end
  end

  def damage_message(damage)
    case damage
    when 0     then return "#{@victim.name} missed!"
    when 10    then return "SPECIAL ATTACK!!"
    when 8,9   then return "Super effective!"
    when 1,2,3 then return "Not very effective!"
    end
  end

  private
  def new_attacker(attacker)
    @players.select { |player| player != attacker }.first
  end
end
