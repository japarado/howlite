class CreateHrs < ActiveRecord::Migration[5.1]
  def change
    create_table :hrs do |t|

      t.timestamps
    end
  end
end
