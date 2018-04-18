class Faculty < ApplicationRecord
  belongs_to :user
  has_many :document_spaces
end
