require 'rest-client'
require 'json'
require 'pry'
require 'JSON'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |character|
    if character["name"] == character_name
      return character["films"]
    end
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |link|
    movies = RestClient.get("#{link}")
    movies_hash = JSON.parse(movies)
    puts movies_hash["title"]
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
