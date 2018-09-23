class ForecastController < ApplicationController
  
  def index
    @states = %w(HI AK CA OR WA ID UT NV AZ NM CO WY MT ND SD NE KS OK TX LA AR MO IA MN WI IL IN MI OH KY TN MS AL GA FL SC NC VA WV DE MD PA NY NJ CT RI MA VT NH ME DC).sort!
    
    if params[:city] != nil
      params[:city].capitalize!
      params[:city].gsub!(" ", "_")
    end
    
    location_exists = false
    Location.all.each do |location|
      if location.city == params[:city] && location.state == params[:state]
        location_exists = true
      end
    end
    
    if params[:city] != nil && params[:state] != nil && !location_exists
      Location.create(city: params[:city], state: params[:state])
    end
    
    if params[:state] != nil && params[:state] != "" && params[:city] != nil && params[:city] != ""
      results = HTTParty.get("http://api.wunderground.com/api/#{api_key}/geolookup/conditions/q/#{params[:state]}/#{params[:city]}.json")
      if results['response']['error'] == nil || results['error'] == ""
        if results.key?("location")
          @location = results['location']['city']
          @state = params[:state]
          @temp_f = results['current_observation']['temp_f']
          @temp_c = results['current_observation']['temp_c']
          @real_feel_f = results['current_observation']['feelslike_f']
          @real_feel_c = results['current_observation']['feelslike_c']
          @weather_words = results['current_observation']['weather']
          @weather_icon = results['current_observation']['icon_url']
          @forecast_link = results['current_observation']['forecast_url']
        else
          @error = "City/State combination does not exist"
        end
      else
        @error = results['response']['error']['description']
      end
    end
    
    @locations = Location.order(:city)
  end
  
  
  private
    
    def api_key
      Rails.application.credentials.wunderground_api_key
    end
    
end
