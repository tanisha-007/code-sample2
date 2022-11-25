require 'uri'
require 'net/http'

class Connection
  BASE = 'https://www.themealdb.com'

  def self.api(root_path)
    uri = URI.parse("#{BASE}#{root_path}")
    request = Net::HTTP::Get.new(uri.request_uri)
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      http.request(request)
    end
  end
end
