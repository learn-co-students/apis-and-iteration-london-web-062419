#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character_name = get_character_from_user

# api_communicator = ApiCommunicator.new


character = get_character_from_user
show_character_movies(character)



# #api_communicator.get_character_movies_from_api(character_name)

# api_communicator.get_character_data(character_name)

# api_communicator.find_character_movies(characters)

# binding.pry
# 0
