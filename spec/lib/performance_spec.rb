# frozen_string_literal: true

require_relative '../../lib/reader'
require_relative '../../lib/data_collector'
require_relative '../../lib/drug_counter'
require_relative '../../lib/total_income'
require_relative '../../lib/printer'
require_relative '../../lib/performance'

describe Performance do
  describe '#perform' do
    subject { described_class.call(file, Reader, DataCollector, DrugCounter, TotalIncome, Printer) }

    context 'when valid file' do
      let(:file) { 'spec/fixtures/test.txt' }

      let(:result) do
        { "Mark" => [1, 5], "Nick" => [1, 5] }
      end

      it 'return a hash of data and print values' do
        expect(subject).to eq(result)
      end
    end
  end
end
