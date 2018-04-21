class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.belongs_to :document_space, index: true
      t.string :attachment
      t.timestamps
    end
  end
end
