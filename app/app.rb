ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/link'
require './app/models/tag'
require './app/data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'

get '/' do
  erb :intro
end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/sign_up_form' do
    erb :sign_up_form
  end

  post '/sign_up_form' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
  end
end

  post '/links' do
    link = Link.new(url: params[:Link], title: params[:Title])
    params[:Tag].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'index/tags'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
