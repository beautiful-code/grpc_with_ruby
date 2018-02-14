# frozen_string_literal: true
require './config/db_config'

ActiveRecord::Base.establish_connection(
  DbConfig.config
)

Dir[File.expand_path './app/models/*.rb'].each do |file|
  require file
end
