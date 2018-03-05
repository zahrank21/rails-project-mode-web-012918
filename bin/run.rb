require_relative '../config/environment'
require_relative '../app/models/adapter.rb'


old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

Adapter.people_call
