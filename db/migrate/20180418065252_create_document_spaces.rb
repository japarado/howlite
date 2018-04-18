class CreateDocumentSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :document_spaces do |t|
      t.belongs_to :faculty, index: true
      t.string :title
      t.timestamps
    end
  end
end
