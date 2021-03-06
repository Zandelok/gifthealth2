# frozen_string_literal: true

require_relative '../../lib/drug_counter'

describe DrugCounter do
  describe '#call' do
    subject { described_class.call(hash) }

    context 'when valid hash' do
      let(:hash) do 
        { "Mark" => { "B" => ["filled", "filled", "created", "filled"], 
            "C" => ["filled"] }, 
            "Nick" => { "A" => ["created", "filled"] } }
      end

      let(:result) do
        { "Mark" => [[1, 5], [0, 0]], 
        "Nick" => [[1, 5]] }
      end

      it 'return a hash' do
        expect(subject).to eq(result)
      end
    end
  end
end
