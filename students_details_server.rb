require 'rubygems'
require 'bundler/setup'
require './lib/students_details_service'
require 'logging'

Bundler.require(:default)

module GRPC
  extend Logging.globally
end

Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

class StudentsDetailsServer
  class << self
    def start
      start_grpc_server
    end

    private

    def start_grpc_server
      @server = GRPC::RpcServer.new(pool_size: 5)
      @server.add_http2_port('0.0.0.0:50052', :this_port_is_insecure)
      @server.handle(StudentsDetailsService)
      @server.run_till_terminated
    end
  end
end

StudentsDetailsServer.start
