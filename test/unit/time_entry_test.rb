require File.dirname(__FILE__) + '/../test_helper'

class TimeEntryTest < ActiveSupport::TestCase

  # update the TimeEntry from a given date
  test "retrieve new log entries from given epoch" do
    count = TimeEntry.loadnew("2010-01-01".to_date)
    assert (count > 0)
  end
end
