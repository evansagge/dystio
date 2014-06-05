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

    desc 'delete <PATH>', 'Deletes the directory or key at the specified path'
    def delete(path) # :nodoc:
      logger.info("Deleting directory or key at #{path}")
    end

    desc 'get <PATH>', 'Fetches the value of the key at the specified path'
    def get(path) # :nodoc:
      logger.info("Fetching key from #{path}")
    end

    desc 'init <PROVIDER>', 'Initializes the specified K/V store'
    def init(provider) # :nodoc:
      logger.info("Initializing #{provider} provider")
    end

    desc 'list <PATH>', 'Lists keys in the directory at the specified path'
    def list(path) # :nodoc:
      logger.info("Listing keys at #{path}")
    end

    desc 'set <PATH> <VALUE>', 'Sets the value of the key at the specified path'
    def set(path, value) # :nodoc:
      logger.info("Setting key at #{path} to #{value}")
    end

    desc 'setup', 'Creates local configuration'
    def setup # :nodoc:
      logger.info('Creating configuration')
    end

    desc 'watch <PROVIDER> <PATH>', 'Watches the configured provider for changes at the specified path'
    def watch(provider, path) # :nodoc:
      logger.info("Watching for change at #{path} for #{provider} provider")
    end

    desc 'version', 'Prints Dystio version information'
    def version # :nodoc:
      puts "#{ARGV[0]} #{Dystio::VERSION}"
    end
    map %w(-v --version) => :version
  end
end
