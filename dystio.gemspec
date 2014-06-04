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

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dystio/version'

Gem::Specification.new do |spec|
  spec.name          = 'dystio'
  spec.version       = Dystio::VERSION
  spec.authors       = ['Tony Burns']
  spec.email         = ['tony@tabolario.com']
  spec.summary       = 'A CLI and Chef plugin for using key-value stores like consul, etcd, and S3.'
  spec.description   = spec.summary
  spec.homepage      = 'https://dystio.github.io'
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'chef', '~> 11.12.0'
end
