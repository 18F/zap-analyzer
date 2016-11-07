require 'bundler/setup'
require 'pry'
require 'json'

require_relative './lib/null_handler'
require_relative './lib/handler_factory'
require_relative './lib/cross_domain_javascript_handler'
require_relative './lib/cache_control_and_pragma_http_header_handler'
require_relative './lib/content_type_missing_handler'
require_relative './lib/x_content_type_options_header_missing_handler'
require_relative './lib/xss_protection_not_enabled_handler'
require_relative './lib/report_writer'

class ZapAnalyzer
  def initialize(json_string)
    @errors = JSON.parse(json_string)
  end

  def perform
    ReportWriter.new(report).perform
  end

  private

  def report
    errors.map do |error|
      cweid = error['cweid']
      handler = HandlerFactory.new(cweid).build

      handler.new(error).perform
    end
  end

  attr_reader :errors
end
