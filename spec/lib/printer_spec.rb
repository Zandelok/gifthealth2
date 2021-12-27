# frozen_string_literal: true

require_relative '../../lib/printer.rb'

describe Printer do
  describe '#call' do
    subject { described_class.new(hash).call }

    context 'when valid hash' do
      let(:hash) { { "Mark" => [1, 5], "Nick" => [1, 5] } }

      it 'return a hash of data and print values' do
        expect(subject).to eq(
          { "Mark" => [1, 5], "Nick" => [1, 5] }
        )
      end
    end
  end
end
