Dir[File.expand_path './app/controllers/*.rb'].each do |file|
  require file
end
