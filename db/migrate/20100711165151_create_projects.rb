class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :parent_id
      t.string :identifier
      t.integer :status
      t.integer :sponsor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
