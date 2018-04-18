class Faculty < ApplicationRecord
  belongs_to :user
  has_many :document_spaces
  has_many :jobs, :through => :applications
end