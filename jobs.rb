require 'restclient'
require 'json'
require 'market_point'

job 'marketpoint.fetch' do
  raw = RestClient.get('http://www.google.com/finance/info?client=ig&q=INDEXDJX:.DJI', :accept => :json)
  data = JSON.parse raw.gsub(%r{^//}, '')
  MarketPoint.create :value => data.first['l'], :timestamp => Time.now
end
