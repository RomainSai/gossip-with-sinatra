require 'gossip'

class GossipProjectApp < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossip/:id' do
    page = params[:id].to_i
    erb :gossip_index, locals: {gossip: Gossip.find(page), page: page + 1}
  end

  get '/gossips/new' do
    erb :new_gossip
  end

  post '/gossips/new' do
    Gossip.new("#{params['gossip_author']}", "#{params['gossip_content']}").save
    redirect '/'
  end
end
