require_relative './nullify_400_errors_helper'

class XContentTypeOptionsHeaderMissingHandler
  include Nullify400ErrorsHelper

  def initialize(error)
    @error = error
  end

  def perform
    [error['id'], is_false_positive?, "CWE #{cweid} #{false_positive_explanation}"]
  end

  private

  def is_false_positive?
    is_400?
  end

  def false_positive_explanation
    if is_false_positive?
      "This is a false positive because a 400 error page may omit the x-content-type-options header."
    else
      "This is not a false positive."
    end
  end

  attr_reader :error
end
