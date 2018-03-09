require_relative '../config/environment'
require_relative '../app/models/adapter.rb'
require 'rest-client'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

# Adapter.clear_shows
# Adapter.clear_people
# Adapter.shows_call
# Adapter.create_shows
Adapter.people_call
Adapter.create_people
