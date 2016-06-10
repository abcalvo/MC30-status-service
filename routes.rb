require_relative 'mc30'

get '/' do
  redirect '/status'
end

get '/status' do
  content_type :json, :charset => 'utf-8'
  response.headers["Access-Control-Allow-Origin"] = "*"
  MC30.status
end
