# frozen_string_literal: true

require_relative '../../lib/reader.rb'
require_relative '../../lib/data_collector.rb'
require_relative '../../lib/counter_by_drug.rb'
require_relative '../../lib/total_income.rb'
require_relative '../../lib/printer.rb'
require_relative '../../lib/performance.rb'

describe Performance do
  describe '#perform' do
    subject { described_class.new(file, Reader, DataCollector, CounterByDrug, TotalIncome, Printer).perform }

    context 'when valid file' do
      let(:file) { 'spec/fixtures/test.txt' }

      it 'return a hash of data and print values' do
        expect(subject).to eq(
          { "Mark" => [1, 5], "Nick" => [1, 5] }
        )
      end
    end
  end
end
