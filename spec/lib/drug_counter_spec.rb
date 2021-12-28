# frozen_string_literal: true

require_relative '../../lib/drug_counter.rb'

describe DrugCounter do
  describe '#call' do
    subject { described_class.new(hash).call }

    context 'when valid hash' do
      let(:hash) {{
          "Mark" => { "B" => ["filled", "filled", "created", "filled"], 
            "C" => ["filled"] }, 
            "Nick" => { "A" => ["created", "filled"] }
        }}
      let(:result) { { "Mark" => [[1, 5], [0, 0]], 
        "Nick" => [[1, 5]] } }

      it 'return a hash' do
        expect(subject).to eq(result)
      end
    end
  end
end
