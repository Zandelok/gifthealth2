# frozen_string_literal: true

require_relative '../../lib/printer'

describe Printer do
  describe '#call' do
    subject { described_class.call(hash) }

    context 'when valid hash' do
      let(:hash) do
        { "Mark" => [1, 5], "Nick" => [1, 5] }
      end

      let(:result) do
        { "Mark" => [1, 5], "Nick" => [1, 5] }
      end

      it 'return a hash of data and print values' do
        expect(subject).to eq(result)
      end
    end
  end
end
