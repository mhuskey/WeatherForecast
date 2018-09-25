# README

WeatherForecast is a web application using Ruby on Rails.

## Features
This is a basic app that uses the Weather Underground API to fetch weather conditions for cities in the United States. The temperature and weather conditions are displayed with a link to display the full forecast. Previous searches are shown as a list that can be selected to search again.
<img src="https://github.com/mhuskey/WeatherForecast/blob/master/app/assets/images/screenshots/WeatherForecast_01.png" />

The Weather Underground API key is stored in the credentials.yml.enc and decrypted with a master.key file. You will need to add your own key to interact with the API.

---

## Usage
1. Clone the app:
 `git clone https://github.com/mhuskey/WeatherForecast.git`
2. Install gem dependencies:
`bundle install`
3. Migrate the databases:
`rails db:migrate`
4. Start the rails server:
`rails server`
5. Open your browser to the local address:
`http://0.0.0.0:3000/`
