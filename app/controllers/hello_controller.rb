class HelloController
  def self.say_hello(grpc_request)
    StudentsDetails::HelloResponse.new(
      body: "Hello #{grpc_request.name}"
    )
  end
end
