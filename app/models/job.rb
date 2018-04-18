class Job < ApplicationRecord

  belongs_to :hr

  validates :title, presence:true
  validates :job_type, presence:true
  validates :salary, presence:true
  validates :desc, presence:true

end
