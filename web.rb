require 'sinatra'
require 'market_point'

get '/' do
  "<h1>Dow Jones data points</h1>" + MarketPoint.all(:order => 'timestamp desc').map { |m| "<ul>#{m}</ul>" }.join
end
