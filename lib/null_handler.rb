class NullHandler
  def initialize(error)
    @error = error
  end

  def perform
    [error['id'], false, "CWE #{cweid} not currently handled."]
  end

  private

  def cweid
    error['cweid']
  end

  attr_reader :error
end
