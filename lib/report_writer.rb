class ReportWriter
  def initialize(report)
    @report = report
  end

  def perform
    STDOUT.puts content
  end

  private

  def content
    report.sort_by! {|r| r[2]}.reverse!

    grouped = report.group_by {|r| r[2]}

    output = "# False Positive Report \n"
    output << "\n"
    grouped.each_pair do |explanation, errors|
      output << "## #{explanation} \n"
      output << "\n"
      errors.each do |error|
        output << "- Error ID: #{error[0]} \n"
      end
      output << "\n"
      output << "\n"
    end

    output
  end

  attr_reader :report
end
