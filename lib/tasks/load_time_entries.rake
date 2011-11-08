
namespace :hourbank do
  desc "Load new time log entries"
  task :load => :environment do

    TimeEntry.loadnew('2009-01-01'.to_date)
  end
end

