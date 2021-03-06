module Backburner
  module Logger
    # Loads in instance and class levels
    def self.included(base)
      base.extend self
    end

    # Print out when a job is about to begin
    def log_job_begin(body)
      log_info [ "Working", body ].join(' ')
      @job_begun = Time.now
    end

    # Print out when a job completed
    def log_job_end(name, failed=false)
      ellapsed = Time.now - @job_begun
      ms = (ellapsed.to_f * 1000).to_i
      log_info "Finished #{name} in #{ms}ms #{failed ? ' (failed)' : ''}"
    end

    # Print a message to stdout
    #
    # @example
    #   log_info("Working on task")
    #
    def log_info(msg)
      puts msg
    end

    # Print an error to stderr
    #
    # @example
    #   log_error("Task failed!")
    #
    def log_error(msg)
      $stderr.puts msg
    end

  end
end