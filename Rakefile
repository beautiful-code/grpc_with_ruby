# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)
Dotenv.load

Dir[File.expand_path 'lib/tasks/*.rake'].each do |file|
  import file
end
