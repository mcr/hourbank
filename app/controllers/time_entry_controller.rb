class TimeEntryController < ApplicationController
  active_scaffold :time_entry do |config|
    config.label = "Time Log Entries"
    config.list.columns = [:comments, :hours, :spent_on, :project ]
  end

end
