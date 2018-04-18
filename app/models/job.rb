class Job < ApplicationRecord

  belongs_to :hr

  has_many :applications
  has_many :jobs, through: :applications

  validates :title, presence:true
  validates :job_type, presence:true
  validates :salary, presence:true
  validates :desc, presence:true

end
