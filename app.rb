# app.rb

require 'sinatra'
require 'sinatra/reloader'
require './greeter'

# also_reload './greeter.rb'

require 'better_errors'

configure :development do
	use BetterErrors::Middleware
	BetterErrors.application_root = __dir__
end

# before filter
before do
  @greeter = Greeter.new
end

# our application's routes
get '/hi' do
  @greeter.greet
end

# return quotes matching a tag
get '/quote/:tag' do
	@greeter.quote params[:tag]
end

get '/photo' do
	rand_num = rand(1..4)
	send_file "public/#{rand_num}.jpg"
end

# default /quote route
get '/quote' do
  "some quote"
end
