
module ApiHelper 
    class Api
        def self.events_api
            base_uri =  "https://api.londontheatredirect.com/rest/v2/Events"
            url = URI(base_uri)

            https = Net::HTTP.new(url.host, url.port);
            https.use_ssl = true

            request = Net::HTTP::Get.new(url)
            request["Content-Type"] = "application/json"
            request["Api-Key"] = "u3bu7u7mb1qs8oan07mwcdft"

            response = https.request(request)
            @shows = JSON.parse(response.read_body)
            @shows = @shows['Events']
        end


        def self.performance_api(event_id, event_date)
            base_uri = "https://api.londontheatredirect.com/rest/v2/Events/#{event_id}/Performances?dateFrom=#{event_date}"
            url = URI(base_uri)
            https = Net::HTTP.new(url.host, url.port);
            https.use_ssl = true
            request = Net::HTTP::Get.new(url)
            request["Content-Type"] = "application/json"
            request["Api-Key"] = "u3bu7u7mb1qs8oan07mwcdft"
            response = https.request(request)
            @perform = JSON.parse(response.read_body)
            @perform = @perform['Performances']
        end

        def self.venue_api
    
            base_uri =  "https://api.londontheatredirect.com/rest/v2/Venues"
            url = URI(base_uri)
            https = Net::HTTP.new(url.host, url.port);
            https.use_ssl = true
    
            request = Net::HTTP::Get.new(url)
            request["Content-Type"] = "application/json"
            request["Api-Key"] = "u3bu7u7mb1qs8oan07mwcdft"
    
            response = https.request(request)
            @theatres = JSON.parse(response.read_body)
            @theatres = @theatres['Venues']
        end 
    end

end 