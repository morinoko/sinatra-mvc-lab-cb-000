require_relative 'models/piglatinizer'
require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/piglatinize' do
    piglatinizer = PigLatinizer.new
    @piglatined_phrase = piglatinizer.piglatinize(params[:user_phrase])

    # Alternative
    # @phrase = PigLatinizer.new(params[:user_phrase])

    erb :piglatinize
  end
end
