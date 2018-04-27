class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.belongs_to :job
      t.belongs_to :faculty

      t.timestamps
    end
  end
end
