require 'mongo_mapper'

MongoMapper.config = { :development => { 'uri' => ENV['MONGO_URL'] || 'mongodb://localhost/clockwork-sinatra-beanstalk' } }
MongoMapper.connect(:development)

class MarketPoint
  include MongoMapper::Document

  key :value, String
  key :timestamp, Time

  def to_s
    "#{value} at #{timestamp}"
  end
end
