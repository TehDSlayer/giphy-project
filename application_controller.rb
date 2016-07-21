require 'bundler'
require_relative 'models/model.rb'
Bundler.require

class ApplicationController < Sinatra::Base

  get '/' do
    @title = "Homepage"
    erb :index, :layout => :base
  end

  post '/results' do
    @title = "results"
		@user_input = params[:giphy]
		@api_response = format_request_and_send_api_call(@user_input)
		@gif_link = @api_response["fixed_height"]["url"]
		
    erb :results
  end

end
