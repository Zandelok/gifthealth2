# frozen_string_literal: true

require_relative '../../lib/reader.rb'

describe Reader do
  describe '#call' do
    subject { described_class.new(file).call }

    context 'when valid file' do
      let(:file) { 'spec/fixtures/test.txt' }

      let(:result) do
        "Nick A created\nNick A filled\nMark B filled\nMark B filled\nMark B created\nMark B filled\nMark C filled"
      end

      it 'return a string' do
        expect(subject).to eq(result)
      end
    end

    context 'when ivalid file' do
      let(:file) { 'spec/fixtures/some.txt' }

      it 'raise StandardError' do
        expect{subject}.to raise_error StandardError
      end
    end
  end
end
