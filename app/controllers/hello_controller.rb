class HelloController
  def self.say_hello(request)
    StudentsDetails::HelloResponse.new(
      body: "Hello #{request.name}"
    )
  end
end
