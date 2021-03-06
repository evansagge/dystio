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


require 'thor'
require 'dystio/logging'

module Dystio
  # The Dystio CLI application.
  class CLI < Thor
    include Dystio::Logging

    default_task :watch

    desc 'checkconfig', "Validates Dystio's configuration file"
    # Executes the checkconfig command.
    #
    # @see Dystio::Commands::CheckConfig
    #
    def checkconfig
      require 'dystio/commands/check_config'
      Dystio::Commands::CheckConfig.call(options)
    end

    desc 'delete PATH', 'Deletes a directory or item'
    # Executes the delete command.
    #
    # @see Dystio::Commands::Delete
    #
    def delete(path)
      require 'dystio/commands/delete'
      Dystio::Commands::Delete.call(path, options)
    end

    desc 'get PATH', 'Fetches an item'
    # Executes the get command.
    #
    # @see Dystio::Commands::Get
    #
    def get(path)
      require 'dystio/commands/get'
      Dystio::Commands::Get.call(path, options)
    end

    desc 'init', "Generates Dystio's configuration file"
    # Executes the init command.
    #
    # @see Dystio::Commands::Init
    #
    def init
      require 'dystio/commands/init'
      Dystio::Commands::Init.call(options)
    end

    desc 'list PATH', 'Fetches a list of items in a directory'
    # Executes the list command.
    #
    # @see Dystio::Commands::List
    #
    def list
      require 'dystio/commands/list'
      Dystio::Commands::List.call(options)
    end

    desc 'set PATH VALUE', 'Sets the value of an item'
    # Executes the set command.
    #
    # @see Dystio::Commands::Set
    #
    def set(path, value)
      require 'dystio/commands/set'
      Dystio::Commands::Set.call(path, value, options)
    end

    desc 'start', 'Starts the watcher'
    # Executes the start command.
    #
    # @see Dystio::Commands::Start
    #
    def start
      require 'dystio/commands/start'
      Dystio::Commands::Start.call(options)
    end

    desc 'version', 'Prints Dystio version information'
    def version # @private
      puts "#{ARGV[0]} #{Dystio::VERSION}"
    end
    map %w(-v --version) => :version
  end
end
