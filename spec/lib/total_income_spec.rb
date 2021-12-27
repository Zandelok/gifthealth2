# frozen_string_literal: true

require_relative '../../lib/total_income.rb'

describe TotalIncome do
  describe '#total' do
    subject { described_class.new(hash).total }

    context 'when valid hash' do
      let(:hash) { { "Mark"=>[[1, 5], [0, 0]], 
        "Nick"=>[[1, 5]] } }

      it 'return a hash' do
        expect(subject).to eq(
          { "Mark"=>[1, 5], "Nick"=>[1, 5] }
        )
      end
    end
  end
end
