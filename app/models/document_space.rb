class DocumentSpace < ApplicationRecord
  belongs_to :faculty
  has_many :documents
end
