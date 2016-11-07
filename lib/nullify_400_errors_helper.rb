require 'rest-client'

module Nullify400ErrorsHelper
  def url
    error['url']
  end

  def is_400?
    code = nil
    RestClient.get(url) do |response, request, result|
      code = response.code
    end

    (400..499).to_a.include? code
  end
end
