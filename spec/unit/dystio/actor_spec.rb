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
require 'celluloid'
require 'dystio/actor'

describe Dystio::Actor do
  context 'when testing' do
    context 'class methods' do
      subject { Class.new { include Dystio::Actor } }

      it 'responds to new_link' do
        expect(subject.new_link).to be_a(subject)
      end

      it 'responds to trap_exit' do
        expect { subject.trap_exit }.not_to raise_error
      end
    end

    context 'instance methods' do
      subject { Class.new { include Dystio::Actor }.new }

      it 'returns self for current_actor' do
        expect(subject.current_actor).to be(subject)
      end

      it 'responds to after' do
        expect { subject.after('something') }.not_to raise_error
      end

      it 'returns true for alive if @dead is undefined' do
        subject.instance_variable_set(:@dead, false)
        expect(subject.alive?).to eq(true)
      end

      it 'returns false for alive if @dead is true' do
        subject.instance_variable_set(:@dead, true)
        expect(subject.alive?).to eq(false)
      end

      it 'sets @dead to true' do
        subject.terminate
        expect(subject.alive?).to eq(false)
      end

      it 'yields for #defer' do
        expect { |block| subject.defer(&block) }.to yield_with_no_args
      end
    end
  end

  context 'when not testing' do
    # rubocop:disable GlobalVars
    around do |example|
      $TESTING = false
      example.run
      $TESTING = true
    end
    # rubocop:enable GlobalVars

    it 'includes Celluloid' do
      includer = Class.new { include Dystio::Actor }
      expect(includer.ancestors).to include(Celluloid)
    end
  end
end
