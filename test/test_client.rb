require './lib/protos/students_details_services_pb'

require 'grpc'

stub = StudentsDetails::StudentsDetailsService::Stub.new(
  '0.0.0.0:50052', :this_channel_is_insecure
)

puts "testing hello rpc"
request = StudentsDetails::HelloRequest.new(name: "Harry")
response = stub.hello(request)
puts response.body

puts "testing search_students rpc"
search_request = StudentsDetails::SearchRequest.new(name: "Harry")
begin
  response = stub.search_students(search_request)
  response.students.each do |student|
    puts "Name: #{student.name}, Age: #{student.age}"
  end
rescue GRPC::BadStatus => e
  if e.code == GRPC::Core::StatusCodes::NOT_FOUND
    puts e.message
  end
end
