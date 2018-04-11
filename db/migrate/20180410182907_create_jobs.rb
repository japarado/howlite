class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :job_type
      t.decimal :salary
      t.text :desc
      t.timestamps
    end
  end
end
