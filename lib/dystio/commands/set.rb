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


require 'dystio/command'
require 'dystio/commands'

module Dystio
  module Commands
    # Sets a the value of an item.
    class Set < Dystio::Command
      # Initializes an instance of the command with the specified path, value, and options.
      #
      # @param [String] path the path to the item in the provider.
      # @param [String] value the value to set the item to.
      #
      def initialize(path, value, options = {})
        super(options)
        @path = path
        @value = value
      end

      # Executes the command.
      def call
      end

      private

      attr_reader :path, :value
    end
  end
end
