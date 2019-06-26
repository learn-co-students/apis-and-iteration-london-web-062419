require 'rest-client'
require 'json'
require 'pry'

class ApiCommunicator



    def get_character_movies_from_api(character_name)
    #make the web request
    response_string = RestClient.get("http://www.swapi.co/api/people") #get the api data
    response_hash = JSON.parse(response_string) #parse the api data
  #set a variable = to a hash iteration, find method then search the the name hash downcase split to get the first word equal to character name.
    character_data = response_hash["results"].find { |data| data["name"].downcase.split.first == character_name }
    films = character_data["films"] # films variable set to character data films section 
    films_data = films.map { |data| JSON.parse(RestClient.get(data)) } # set a film data variable = to a map of the films iteration parsing the previous data iteration.
    films_data # return the film data hash.
    end
   binding.pry
   0

#     Walkthrough solution 
#  var = response_hash["results"].find {|character| character["name"] == character_name }
# films_array= character["films"].map{|films| JSON.parse(RestClient.get(films))}





    # iterate over the response hash to find the collection of `films` for the given
    #   `character`
    # collect those film API urls, make a web request to each URL to get the info
    #  for that film
    # return value of this method should be collection of info about each film.
    #  i.e. an array of hashes in which each hash reps a given film
    # this collection will be the argument given to `print_movies`
    #  and that method will do some nice presentation stuff like puts out a list
    #  of movies by title. Have a play around with the puts with other info about a given film.
    
    
  
  
#   def print_movies(films)
#     # some iteration magic and puts out the movies in a nice list
#     films.each.with_index(1) do |data, index| 
#       puts "#{index}" + data['title']
    
#     # films_hash.each do |films|
    
#     #   puts films["title"]
#    end
# end
def print_movies(films_data)
  #puts out the list of movies by tittles
  films_data.map {|films| puts films["title"]} #iterate over the hash films data and pull out the tittle

end



  def show_character_movies(character_name)
    films = get_character_movies_from_api(character_name)
    print_movies(films)
  end

end
  ## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
