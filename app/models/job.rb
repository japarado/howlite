class Job < ApplicationRecord
  #enum type: [:pt,:ft,:greater_than_20k,:greater_than_30k]

  validates :title, presence: true
  validates :job_type, presence: true
  validates :salary, presence: true
  validates :desc, presence: true

  belongs_to :hr
  has_many :applications
  has_many :faculties, :through => :applications

  scope :job_type, -> (job_type) {where job_type: job_type}
  scope :term, -> (search_term) {where("title like ? or desc like ?", "%#{search_term}%", "%#{search_term}%")}
  scope :salary, -> (expected_salary) {where("salary > ?", "#{expected_salary}")}

  #scope :part_time, -> {where(job_type: "PT")}
  #scope :full_time, -> {where(job_type: "FT")}
  #scope :average, -> {  }

  def self.send_chain(methods)
    methods.inject(self, :send)
  end

end
