require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_content"], params["gossip_author"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
    id = params["id"].to_i
    erb :show, locals: {gossip: Gossip.find(id)}
  end

  get '/gossips/:id/edit/' do
    erb :edit
  end

  post '/gossips/:id/edit/' do
    id = params["id"].to_i
    Gossip.update(id, params["gossip_content"], params["gossip_author"])
    redirect '/'
  end

end