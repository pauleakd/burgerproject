require('sinatra')


get '/days' do
  @days = Day.all
  erb(:days)
end

post '/days' do
  id = params['day_id']
  # binding.pry
  redirect "/days/#{id}"
end

get '/days/:id' do
  @day = Day.find(params[:id])
  @deals = Day.find_deals(params[:id])
  # binding.pry
  erb(:day_deals)
end