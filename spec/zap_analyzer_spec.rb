require 'spec_helper'

describe ZapAnalyzer do
  describe '#perform', vcr: {record: :all} do
    it 'should generate a report' do
      raw_data = File.read('spec/data/scan-short.json')
      errors = JSON.parse(raw_data)

      report = ZapAnalyzer.new(errors).perform

      explanation = 'CWE 829 This error is a false positive because the cross domain javascript comes from the trusted host: ajax.googleapis.com'
      expect(report).to include(explanation)
    end
  end
end
