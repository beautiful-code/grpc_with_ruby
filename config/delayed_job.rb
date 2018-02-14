require './lib/students_details_service'

# Delayed job expects a RAILS module
module Rails
  extend self

  def root
    File.dirname(File.expand_path('..', __FILE__))
  end

  def logger
    @logger ||= Logger.new $stdout
  end
end

Delayed::Worker.backend = :active_record
Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 5
Delayed::Worker.max_attempts = 5
Delayed::Worker.max_run_time = 5.minutes
Delayed::Worker.logger = Logger.new $stdout
