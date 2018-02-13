require './lib/protos/students_details_services_pb'

require 'grpc'

stub = StudentsDetails::StudentsDetailsService::Stub.new(
  '0.0.0.0:50052', :this_channel_is_insecure
)

request = StudentsDetails::HelloRequest.new(name: "Harry")
response = stub.hello(request)
puts response.body
