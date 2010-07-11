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

end
