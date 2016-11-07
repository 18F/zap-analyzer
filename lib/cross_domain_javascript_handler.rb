class CrossDomainJavascriptHandler
  def initialize(error)
    @error = error
  end

  def perform
    [error['id'], is_false_positive?, false_positive_explanation]
  end

  def false_positive_explanation
    if is_false_positive?
      "This error is a false positive because the cross domain javascript comes from the trusted host: #{host}"
    else
      "Not a false positive"
    end
  end

  private

  HOST_WHITELIST = [
    'ajax.googleapis.com',
    'dap.digitalgov.gov'
  ]

  def is_false_positive?
    HOST_WHITELIST.include? host
  end

  def url
    error['param']
  end

  def host
    URI.parse(url).host
  end

  attr_reader :error
end
