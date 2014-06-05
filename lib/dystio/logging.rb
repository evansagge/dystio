# Copyright 2014 Tony Burns
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'logger'
require 'time'

module Dystio
  # Provides the logging facility used throughout the rest of the API.
  module Logging
    # The default log formatter used for all logs.
    class PrettyFormatter < Logger::Formatter
      # Returns a log event formatted as human-readable text
      def call(severity, time, _, message)
        "#{time.utc.iso8601} PID-#{Process.pid} TID-#{Thread.current.object_id.to_s(36)} #{severity}: #{message}"
      end
    end

    class << self
      # Sets the singleton logger
      attr_writer :logger

      # Returns the singleton logger
      def logger
        @logger ||= Logger.new(STDOUT).tap do |logger|
          logger.level = Logger::INFO
          logger.formatter = Dystio::Logging::PrettyFormatter.new
        end
      end
    end

    # Fetches the singleton logger
    def logger
      Dystio::Logging.logger
    end
  end
end
