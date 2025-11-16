require "json"
require "http/client"

class UniRateApi
  API_PATH = "api"
  def initialize(@api_key : String)
    @headers = HTTP::Headers {
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://api.unirateapi.com")
    @http_client = HTTP::Client.new(uri)
  end

  def get_currencies() : JSON::Any
    JSON.parse(
      @http_client.get(
        "/#{API_PATH}/currencies?api_key=#{@api_key}",headers: @headers).body)
  end

  def get_rates() : JSON::Any
    JSON.parse(
      @http_client.get(
        "/#{API_PATH}/rates?api_key=#{@api_key}", headers: @headers).body)
  end

  def get_vat_rates() : JSON::Any
    JSON.parse(
      @http_client.get(
        "/#{API_PATH}/rates?api_key=#{@api_key}", headers: @headers).body)
  end

  def get_historical_limits() : JSON::Any
    JSON.parse(
      @http_client.get(
        "/#{API_PATH}/historical/limits?api_key=#{@api_key}", headers: @headers).body)
  end

  def convert_price(
      from : String, to : String, amount : Int32) : JSON::Any
    JSON.parse(
      @http_client.get(
        "/#{API_PATH}/convert?from=#{from}&to=#{to}&amount=#{amount}&api_key=#{@api_key}",
        headers: @headers).body)
  end
end
