require 'rest-client'
require 'json'
require 'pry'
class ApiCommunicator

  URL = 'http://www.swapi.co/api/people/'

  def get_character_data(character_name)
  
       characters = RestClient.get("#{URL}/people/#{character_name}")

       response_hash = JSON.parse(characters)
       
       character = response_hash["results"].find { |character| character["name"] == character_name}
  end

  def print_movies(films)
    films.each{|film| puts film}
  end 

    def find_character_movies(characters)
      characters["films"].map { |film| JSON.parse(RestClient.get(film)) }
    end
end 

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

