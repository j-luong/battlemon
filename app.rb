require './lib/game'
require './lib/player'
require 'sinatra/base'

class Battlemon < Sinatra::Base
  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    @game.attack(@game.victim)
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
