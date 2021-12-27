# frozen_string_literal: true

require_relative '../../lib/counter_by_drug.rb'

describe CounterByDrug do
  describe '#call' do
    subject { described_class.new(hash).call }

    context 'when valid hash' do
      let(:hash) {{
          "Mark" => { "B" => ["filled", "filled", "created", "filled"], 
            "C" => ["filled"] }, 
            "Nick" => { "A" => ["created", "filled"] }
        }}

      it 'return a hash' do
        expect(subject).to eq(
          { "Mark" => [[1, 5], [0, 0]], 
          "Nick" => [[1, 5]]}
        )
      end
    end
  end
end
