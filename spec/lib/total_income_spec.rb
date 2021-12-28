# frozen_string_literal: true

require_relative '../../lib/total_income.rb'

describe TotalIncome do
  describe '#call' do
    subject { described_class.new(hash).call }

    context 'when valid hash' do
      let(:hash) do
        { "Mark"=>[[1, 5], [0, 0]], 
        "Nick"=>[[1, 5]] }
      end

      let(:result) do 
        { "Mark"=>[1, 5], "Nick"=>[1, 5] }
      end

      it 'return a hash' do
        expect(subject).to eq(result)
      end
    end
  end
end
