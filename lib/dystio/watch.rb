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


require 'dystio/actor'
require 'dystio/logging'

module Dystio
  # Abstract class that provides base functionality for watches. Watches are provider-specific and monitor providers for item changes for
  # a given path.
  class Watch
    include Dystio::Actor
    include Dystio::Logging
  end
end
