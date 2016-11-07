class HandlerFactory
  def initialize(cweid)
    @cweid = cweid
  end

  def build
    if cweid == '829'
      CrossDomainJavascriptHandler
    elsif cweid == '16'
      XContentTypeOptionsHeaderMissingHandler
    elsif cweid == '525'
      CacheControlAndPragmaHTTPHeaderHandler
    elsif cweid == '345'
      ContentTypeMissingHandler
    elsif cweid == '933'
      XSSProtectionNotEnabledHandler
    else
      NullHandler
    end
  end

  private

  attr_reader :cweid
end
