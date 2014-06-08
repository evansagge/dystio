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
  # The Dystio CLI application
  class CLI < Thor
    include Dystio::Logging

    desc 'delete PATH', 'Deletes a directory or key from the store'
    def delete(path) # :nodoc:
      require 'dystio/commands/delete'
      Dystio::Commands::Delete.call(path, options)
    end

    desc 'get PATH', 'Fetches the value of a key from the store'
    def get(path) # :nodoc:
      require 'dystio/commands/get'
      Dystio::Commands::Get.call(path, options)
    end

    desc 'init PROVIDER', 'Initializes a provider for use with Dystio'
    def init # :nodoc:
      require 'dystio/commands/init'
      Dystio::Commands::Init.call(options)
    end

    desc 'list PATH', 'Fetches a list of keys in a directory from the store'
    def list # :nodoc:
      require 'dystio/commands/list'
      Dystio::Commands::List.call(options)
    end

    desc 'set PATH VALUE', 'Sets the value of a key in the store'
    def set(path, value) # :nodoc:
      require 'dystio/commands/set'
      Dystio::Commands::Set.call(path, value, options)
    end

    desc 'watch', 'Watches for changes at the specified path in the store'
    def watch # :nodoc:
      require 'dystio/commands/watch'
      Dystio::Commands::Watch.call(options)
    end

    desc 'version', 'Prints Dystio version information'
    def version # :nodoc:
      puts "#{ARGV[0]} #{Dystio::VERSION}"
    end
    map %w(-v --version) => :version
  end
end
