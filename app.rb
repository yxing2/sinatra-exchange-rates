require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

currency_url = "https://api.exchangerate.host/symbols"
raw_response = HTTP.get(currency_url).to_s
parsed_response = JSON.parse(raw_response)
results = parsed_response.fetch("symbols")

get("/") do
  @currency = results.keys
erb(:homepage)
end

get ("/:currency_url") do
  @select_code = params.fetch("currency_url")
  @currency = results.keys


erb(:flexible)
end
