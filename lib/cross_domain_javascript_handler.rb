class CrossDomainJavascriptHandler
  include HandlerHelper

  def initialize(error)
    @error = error
  end

  def perform
    [error['id'], is_false_positive?, "CWE #{cweid} #{false_positive_explanation}", summary]
  end

  def false_positive_explanation
    if is_false_positive?
      "This error is a false positive because the cross domain javascript comes from the trusted host: #{host}"
    else
      "This might be a false positive. Ensure if cross-domain javascript from #{host} can be trusted."
    end
  end

  private

  HOST_WHITELIST = [
    'ajax.googleapis.com',
    'dap.digitalgov.gov',
    'ethn.io'
  ]

  def is_false_positive?
    HOST_WHITELIST.include? host
  end

  def param
    error['param']
  end

  def host
    URI.parse(param).host
  end

  def cweid
    error['cweid']
  end

  attr_reader :error
end
