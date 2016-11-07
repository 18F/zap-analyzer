class ContentTypeMissingHandler
  def initialize(error)
    @error = error
  end

  def perform
    [error['id'], is_false_positive?, "CWE #{cweid} #{false_positive_explanation}"]
  end

  private

  OAUTH_PATHS = [
    '/auth/github'
  ]

  def url
    error['url']
  end

  def path
    URI.parse(url).path
  end

  def is_false_positive?
    OAUTH_PATHS.include?(path)
  end

  def false_positive_explanation
    if is_false_positive?
      "This is a false positive because the content-type header can be missing on an OAuth redirect URL."
    else
      "This is likely not a false positive and needs to be addressed. CWE #{error['cweid']}"
    end
  end

  def cweid
    error['cweid']
  end

  attr_reader :error
end
