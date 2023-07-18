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
