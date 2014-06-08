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

require 'dystio/logging'

module Dystio
  # Abstract class that provides base functionality for command classes.
  class Command
    include Dystio::Logging

    # Initializes an instance of the command with the specified options.
    #
    # @param [Hash] options additional options passed from the CLI.
    #
    # @see {Dystio::CLI}
    #
    def initialize(options = {})
      @options = options
    end

    # Creates an instance of the command and executes it.
    #
    # @param [Array] args arguments to pass to the command.
    def self.call(*args)
      new(*args).call
    end

    # Performs the command. Must be implemented in subclasses.
    def call
      fail NotImplementedError
    end

    protected

    # Additional options passed to the command.
    attr_reader :options
  end
end
