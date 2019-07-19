class SearchController < ApplicationController
  def index

  house = params[:house]

  response = Faraday.get("http://westerosapi.herokuapp.com/api/v1/house/#{house}?api_key=#{ENV['API-KEY']}")

  results = JSON.parse(response.body, symbolize_names: true)[:data][0][:attributes][:members]

  @house = JSON.parse(response.body, symbolize_names: true)[:data][0][:attributes][:name]
  @members  = results.map do |result|
     Member.new(result)
  end

  end
end
