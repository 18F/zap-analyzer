class NullHandler
  def initialize(error)
    @error = error
  end

  def perform
    [error['id'], false, "CWE #{error['cweid']} not currently handled."]
  end

  private

  attr_reader :error
end
