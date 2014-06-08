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


module Dystio
  # Abstraction on top of Celluloid to facilitate testing.
  #
  # Basically a reformatted version of {https://github.com/mperham/sidekiq/blob/master/lib%2Fsidekiq%2Factor.rb Sidekiq::Actor}.
  #
  module Actor
    # @private
    module TestingClassMethods
      def new_link(*args)
        new(*args)
      end

      def trap_exit(*)
      end
    end

    # @private
    module TestingInstanceMethods
      def current_actor
        self
      end

      def after(_)
      end

      def alive?
        @dead = false unless defined?(@dead)
        !@dead
      end

      def terminate
        @dead = true
      end

      def defer
        yield
      end
    end

    # Stubs Celluloid methods for testing.
    def self.included(includer)
      if $TESTING # rubocop:disable GlobalVars
        includer.__send__(:extend, TestingClassMethods)
        includer.__send__(:include, TestingInstanceMethods)
      else
        includer.__send__(:include, Celluloid)
      end
    end
  end
end
