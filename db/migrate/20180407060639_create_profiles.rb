class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :picture
      t.string :description
      t.date :dob
      t.string :region
      t.string :city
      t.string :street_address
      t.string :contact_number


      t.timestamps
    end
  end
end
