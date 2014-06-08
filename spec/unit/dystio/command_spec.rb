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
require 'dystio/command'

describe Dystio::Command do
  subject { described_class.new({}) }

  describe '.call' do
    let(:arguments) { ['some', 'arguments', { name: :value }] }
    let(:command_instance) { instance_double('Dystio::Command') }

    before do
      allow(command_instance).to receive(:call)
      allow(described_class).to receive(:new).and_return(command_instance)
    end

    it 'instantiates the command class with the specified arguments' do
      expect(described_class).to receive(:new).with(*arguments).and_return(command_instance)
      described_class.call(*arguments)
    end

    it 'executes the command' do
      expect(command_instance).to receive(:call)
      described_class.call(*arguments)
    end
  end

  describe '#call' do
    it 'raises a NotImplementedError' do
      expect { subject.call }.to raise_error(NotImplementedError)
    end
  end
end
