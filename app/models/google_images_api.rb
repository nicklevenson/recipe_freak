class GoogleImagesApi

  def self.fetch_images(query)
   
        
    url = URI("https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/Search/ImageSearchAPI?pageNumber=1&pageSize=10&q=#{query}&autoCorrect=true")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = 'bf9f4086e0msh88185764779cbb1p1b6afajsn6a1e8378fa57'
    request["x-rapidapi-host"] = 'contextualwebsearch-websearch-v1.p.rapidapi.com'

    response = http.request(request)
    json = JSON.parse(response.read_body)["value"][0..5]
    

  end

end
