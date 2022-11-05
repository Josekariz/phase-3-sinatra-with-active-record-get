class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello from the ohter side" }.to_json
  end
  
  get '/games' do
    games = Game.all
    games.to_json
  end

  # get '/user/:id' do
  #   games = User.find(params[:id])
  #   games.to_json(include: :reviews)
  #   end

  get '/games/:id' do
    game = Game.find(params[:id])

    # include associated reviews in the JSON response
    game.to_json(include: { reviews: { include: :user } })

    end
end
