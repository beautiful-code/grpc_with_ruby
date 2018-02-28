# including concerns
Dir[File.expand_path './app/controllers/concerns/*.rb'].each do |file|
    require file
end

Dir[File.expand_path './app/controllers/*.rb'].each do |file|
  require file
end
