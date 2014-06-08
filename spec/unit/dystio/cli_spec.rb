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

require 'spec_helper'
require 'dystio/cli'

describe Dystio::CLI do
  subject { described_class.new(arguments) }

  describe '#checkconfig' do
    let(:arguments) { [] }

    it 'runs an instance of the checkconfig command' do
      checkconfig_command = class_double('Dystio::Commands::CheckConfig')
      stub_const('Dystio::Commands::CheckConfig', checkconfig_command)
      expect(checkconfig_command).to receive(:call).with(anything)
      subject.invoke(:checkconfig)
    end
  end

  describe '#delete' do
    let(:arguments) { %w(/path/to/key) }

    it 'calls an instance of the delete command' do
      delete_command = class_double('Dystio::Commands::Delete')
      stub_const('Dystio::Commands::Delete', delete_command)
      expect(delete_command).to receive(:call).with('/path/to/key', anything)
      subject.invoke(:delete)
    end
  end

  describe '#get' do
    let(:arguments) { %w(/path/to/key) }

    it 'runs an instance of the get command' do
      get_command = class_double('Dystio::Commands::Get')
      stub_const('Dystio::Commands::Get', get_command)
      expect(get_command).to receive(:call).with('/path/to/key', anything)
      subject.invoke(:get)
    end
  end

  describe '#init' do
    let(:arguments) { [] }

    it 'runs an instance of the init command' do
      init_command = class_double('Dystio::Commands::Init')
      stub_const('Dystio::Commands::Init', init_command)
      expect(init_command).to receive(:call).with(anything)
      subject.invoke(:init)
    end
  end

  describe '#set' do
    let(:arguments) { %w(/path/to/key value) }

    it 'runs an instance of the set command' do
      set_command = class_double('Dystio::Commands::Set')
      stub_const('Dystio::Commands::Set', set_command)
      expect(set_command).to receive(:call).with('/path/to/key', 'value', anything)
      subject.invoke(:set)
    end
  end

  describe '#watch' do
    let(:arguments) { [] }

    it 'runs an instance of the watch command' do
      watch_command = class_double('Dystio::Commands::Watch')
      stub_const('Dystio::Commands::Watch', watch_command)
      expect(watch_command).to receive(:call).with(anything)
      subject.invoke(:watch)
    end
  end

  describe '#version' do
  end
end
