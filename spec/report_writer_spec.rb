require 'spec_helper'
require 'redcarpet'
require 'nokogiri'

describe 'ReportWriter' do
  describe '#perform' do
    it 'generates a markdown report' do
      error_id_1 = 1
      error_id_2 = 2
      error_id_3 = 3

      explanation_1 = 'this is an explanation'
      explanation_2 = 'this is another explanation'

      summary = 'This is a generic summary'

      errors = [
        [error_id_1, false, explanation_1, summary],
        [error_id_2, true, explanation_2, summary],
        [error_id_3, false, explanation_1, summary],
      ]

      report = ReportWriter.new(errors).perform

      markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      parsed_markdown = markdown_renderer.render(report)
      parsed_html = Nokogiri::HTML(parsed_markdown)

      expect(parsed_html.search('h1').first.text).to include('False Positive Report')

      expect(parsed_html.search('h2').length).to eq(2)

      expect(report).to include(summary)
      expect(report).to include(explanation_1)
      expect(report).to include(explanation_2)
    end
  end
end
