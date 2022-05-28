require 'open3'

RSpec.describe 'script' do
  let(:stdoutput) { Open3.capture3("./bin/gifthealth #{file}") }
  let(:file) { 'spec/fixtures/test.txt' }
  let(:result) { stdoutput[0] }
  let(:errors) { stdoutput[1] }
  let(:expected_result) { "\"Nick: 1 fills $5 income\"\n\"Mark: 1 fills $5 income\"\n" }

  it { expect(result).to eq expected_result }

  context 'when file not provided' do
    let(:file) {}

    it { expect(errors).to eq "Please, write file name\n" }
  end

  context 'when invalid file' do
    let(:file) { 'spec/fixtures/some.txt' }

    it { expect(errors).to include 'StandardError' }
  end
end
