require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
currency_url = "https://api.exchangerate.host/symbols"
raw_response = HTTP.get(currency_url).to_s
parsed_response = JSON.parse(raw_response)
results = parsed_response.fetch("symbols")

  @currency = results.keys
erb(:homepage)
end

get ("/:currency_one") do
currency_url = "https://api.exchangerate.host/symbols"
raw_response = HTTP.get(currency_url).to_s
parsed_response = JSON.parse(raw_response)
results = parsed_response.fetch("symbols")

  @code_one = params.fetch("currency_one")
  @currency = results.keys
erb(:flexible)
end

get ("/:currency_one/:currency_two") do
  @code_one = params.fetch("currency_one")
  @code_two = params.fetch("currency_two")
  
  currency_url = "https://api.exchangerate.host/convert?from=#{@code_one}&to=#{@code_two}"
  raw_response = HTTP.get(currency_url).to_s
  parsed_response = JSON.parse(raw_response)
  results = parsed_response.fetch("info")
  @rate = results.fetch("rate")

erb(:convert)
end
