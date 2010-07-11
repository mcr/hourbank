class CreateTimeEntries < ActiveRecord::Migration
  def self.up
    create_table :time_entries do |t|
      t.integer  "project_id",  :null => false
      t.integer  "user_id",     :null => false
      t.integer  "issue_id"
      t.float    "hours",       :null => false
      t.string   "comments"
      t.integer  "activity_id", :null => false
      t.date     "spent_on",    :null => false
      t.integer  "tyear",       :null => false
      t.integer  "tmonth",      :null => false
      t.integer  "tweek",       :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :time_entries
  end
end
