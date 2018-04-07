class CreateHrs < ActiveRecord::Migration[5.1]
  def change
    create_table :hrs do |t|
      t.references :user


      t.timestamps
    end
  end
end
