# Weather Sweater
### Weather Sweater is the backend to an app I will be building in the near future called Sweater Weather.

## APIs 

- Flickr
- Google Geolocation
- Darksky API

## Dependencies 

This project uses the following:

 - Ruby 2.4.1
 - Rails 5.2.2
 - rspec-rails
 - figaro
 
## Install 

 - Clone the repo:
 
git@github.com:NickLindeberg/weather_sweater.git 

 - Run:
 
 bundle install
 bundle update
 
 - Setup the database:
 
 rake db:{drop,create,migrate}
 
 ## Testing
 
 Run the tests by running rspec into your command line.

### Note, this project has no views.  You will be able to see JSON responses only. 

### Example Requests

#### Get Weather For A City
`GET /api/v1/forecast?location=denver,co`

`Content-Type: application/json`

`Accept: application/json`

#### Create An Account
`POST /api/v1/users`

`Content-Type: application/json`

`Accept: application/json`

{
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}

#### Login To Account
`POST /api/v1/sessions`

`Content-Type: application/json`

`Accept: application/json`

{
  "email": "whatever@example.com",
  "password": "password"
}

#### Add A Favorite Location
`POST /api/v1/favorites`

`Content-Type: application/json`

`Accept: application/json`

body:

{
  "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
  "api_key": "jgn983hy48thw9begh98h4539h4"
}

#### List Your Favorite Locations
`GET /api/v1/favorites`

`Content-Type: application/json`

`Accept: application/json`

body:

{
  "api_key": "jgn983hy48thw9begh98h4539h4"
}

#### Remove A Favorite Location
`DELETE /api/v1/favorites`

`Content-Type: application/json`

`Accept: application/json`

body:

{
  "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
