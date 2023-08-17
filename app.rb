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

get ("/:currency_one") do
  @code_one = params.fetch("currency_one")
  @currency = results.keys
erb(:flexible)
end

get ("/:currency_one/currency_two") do
  @code_two = params.fetch("currency_two")
  @currency = results.keys
erb(:convert)
end
