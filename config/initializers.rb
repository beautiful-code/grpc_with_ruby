# frozen_string_literal: true

Dir[File.expand_path './config/initializers/*.rb'].each do |file|
  require file
end
