module HandlerHelper
  private

  def error_id
    error['id']
  end

  def error_name
    error['name']
  end

  def url
    error['url']
  end

  def summary
    "Error #{error_id}: #{error['url']} (#{error_name})"
  end
end
