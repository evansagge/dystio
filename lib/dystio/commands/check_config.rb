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

module Dystio
  module Commands
    # Validates Dystio's configuration file.
    class CheckConfig < Dystio::Command
      # Initializes an instance of the command with the specified options.
      def initialize(options = {})
        super(options)
      end

      # Executes the command.
      def call
      end
    end
  end
end
