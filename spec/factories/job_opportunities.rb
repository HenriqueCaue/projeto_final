FactoryBot.define do
  factory :job_opportunity do
    title { "Analista de sistemas" }
    description { "Atuar com ASP NET / Framework 4.0 (ou superior).
    Visual Studio. Suporte para usuários. Desenvolvimento de software." }
    qualifications { "Graduação em análise e desenvolvimento de sistemas." }
    salary_range { 1100.50 }
    experience_level { "Estagiário" }
    deadline { 2.days.from_now }
    location { "Av. Paulista" }
    active { true }
  end
end
