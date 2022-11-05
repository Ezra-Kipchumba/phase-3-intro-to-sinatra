require 'sinatra'

class App < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  get '/nope' do
    "Nope Ezraa..that's not how you always do it"
  end

  get '/dice' do
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json
  end

  # Dynamic routing in Sinatra

  # get '/add/1/2' do
  #   sum = 1 + 2
  #   { result: sum }.to_json
  # end

  get '/add/:num1/:num2' do

    # :num1 and :num2 are name parameters
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end

end

run App
