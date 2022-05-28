# frozen_string_literal: true

require_relative '../../lib/data_collector'

describe DataCollector do
  describe '#call' do
    subject { described_class.call(str) }

    context 'when valid string' do
      let(:str) do
        "Nick A created\nNick A filled\nMark B filled\nMark B filled\nMark B created\nMark B filled\nMark C filled" 
      end

      let(:result) do 
        { "Mark" => { "B" => ["filled", "filled", "created", "filled"], 
          "C" => ["filled"] }, 
          "Nick" => { "A" => ["created", "filled"] } } 
      end

      it 'return a hash' do
        expect(subject).to eq(result)
      end
    end
  end
end
