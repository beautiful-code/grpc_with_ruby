Dir[File.expand_path 'app/*.rb'].each do |file|
  require file
end
