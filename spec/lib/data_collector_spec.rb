# frozen_string_literal: true

require_relative '../../lib/data_collector.rb'

describe DataCollector do
  describe '#call' do
    subject { described_class.new(str).call }

    context 'when valid string' do
      let(:str) { 
        "Nick A created\nNick A filled\nMark B filled\nMark B filled\nMark B created\nMark B filled\nMark C filled" 
      }

      it 'return a hash' do
        expect(subject).to eq({
          "Mark" => { "B" => ["filled", "filled", "created", "filled"], 
            "C" => ["filled"] }, 
            "Nick" => { "A" => ["created", "filled"] }
        })
      end
    end
  end
end
