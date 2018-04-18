class Hr < ApplicationRecord
  belongs_to :user
  has_many :jobs

  has_many :applications
  has_many :jobs, through: :applications
end
