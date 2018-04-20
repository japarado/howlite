class Job < ApplicationRecord
  validates :title, presence: true
  validates :job_type, presence: true
  validates :salary, presence: true
  validates :desc, presence: true

  belongs_to :hr

  has_many :applications
  has_many :faculties, :through => :applications

  validates :title, presence: true
  validates :job_type, presence: true
  validates :salary, presence: true
  validates :desc, presence: true

  scope :part_time, -> {where(job_type: "PT")}
end
