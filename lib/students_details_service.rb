require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)
Dotenv.load

require './lib/protos/students_details_services_pb'
require './config/initializers'
require './app'

class StudentsDetailsService < StudentsDetails::StudentsDetailsService::Service
  def hello(request, _unused_call)
    HelloController.say_hello(request)
  end

  def search_students(request, _unused_call)
    StudentsController.search(request)
  end
end
