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
require 'dystio/logging'

describe Dystio::Logging do
  describe 'pretty formatter' do
    subject { Dystio::Logging::PrettyFormatter.new }

    let(:event) { [severity, time, program_name, message] }
    let(:severity) { 'INFO' }
    let(:program_name) { 'dystio' }
    let(:time) { Time.now }
    let(:message) { 'An informative message' }

    let(:output) { subject.call(*event) }

    it 'contains the ISO8601-formatted timestamp of the event' do
      expect(output).to match(/#{time.utc.iso8601}/)
    end

    it 'contains the PID of the process' do
      expect(output).to match(/#{Process.pid}/)
    end

    it 'contains the object_id of the current thread' do
      expect(output).to match(/#{Thread.current.object_id.to_s(36)}/)
    end

    it 'contains the severity of the event' do
      expect(output).to match(/#{severity}/)
    end

    it 'does not contain the program_name of the event' do
      expect(output).not_to match(/#{program_name}/)
    end

    it 'contains the event message' do
      expect(output).to match(/#{message}/)
    end
  end

  describe '.logger' do
    subject { described_class.logger }

    it 'returns a logger' do
      expect(subject).to be_a(Logger)
    end

    it 'defaults to the info level' do
      expect(subject.level).to eql(Logger::INFO)
    end

    it 'defaults to the pretty formatter' do
      expect(subject.formatter.class).to eql(Dystio::Logging::PrettyFormatter)
    end
  end

  describe '#logger' do
    subject { includer_class.new }

    let(:includer_class) { Class.new { include Dystio::Logging } }

    it 'returns the singleton logger' do
      expect(subject.logger).to be(described_class.logger)
    end
  end
end
