class JobOpportunity < ApplicationRecord
  EXPERIENCES = ["Estagiário", "Júnior", "Pleno", "Sênior", "Especialista",
    "Diretor"]

  validates :title, :location, :description, :qualifications, :salary_range, 
    :experience_level, :deadline, presence: true

  has_many :applies
end
