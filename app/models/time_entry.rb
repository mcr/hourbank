class TimeEntry < ActiveRecord::Base
  belongs_to :project
  #belongs_to :issue
  #belongs_to :user
  #belongs_to :activity, :class_name => 'Enumeration', :foreign_key => :activity_id

  validates_numericality_of :hours, :allow_nil => true, :message => :activerecord_error_invalid

  # tyear, tmonth, tweek assigned where setting spent_on attributes
  # these attributes make time aggregations easier
  def spent_on=(date)
    super
    self.tyear = spent_on ? spent_on.year : nil
    self.tmonth = spent_on ? spent_on.month : nil
    self.tweek = spent_on ? Date.civil(spent_on.year, spent_on.month, spent_on.day).cweek : nil
  end

  # this reaches out to production redmine, and using the json download routine,
  # and activeResource, loads new data from that server.
  def self.loadnew(time)
    records = TimelogResource.get(:details, {
                                    :from => time,
                                    :key => 'f85d971013d77265d0c6f4eb1369839117e7f90f' })

    # { "comments"=>"worked extensively to try to make libfakecamera ",
    #   "created_on"=>"2010/01/06 11:23:37 -0500",
    #   "issue_id"=>263,
    #   "project_id"=>16, 
    #   "tmonth"=>1,
    #   "activity_id"=>9,
    #   "id"=>307, 
    #   "spent_on"=>"2010/01/03",
    #   "updated_on"=>"2010/01/06 11:23:37 -0500", 
    #   "user_id"=>5, 
    #   "hours"=>8.0, 
    #   "tweek"=>53, 
    #   "tyear"=>2010}, 

    records.each { |timelog|
      tl = Hash.new
      columns.each { |col|
        tl[col.name] = timelog[col.name]
      }
      if !TimeEntry.find_by_id(tl[:id]) 
        te = TimeEntry.new(tl)
        te.save!

        if te.project.nil? && !te.project_id.nil?
          if !Project.find_by_id(te.project_id)
            puts "Loading project #{te.project_id}\n"
            project = ProjectResource.find(te.project_id,
                                           :params => { :key => 'f85d971013d77265d0c6f4eb1369839117e7f90f'})
            p1 = Hash.new
            Project.columns.each { |col|
              p1[col.name] = project.attributes[col.name.to_s]
            }
            pj = Project.new(p1)
            pj.id = project.id
            pj.save!
          end
        end
      end
    }
    return records.size
  end

end
