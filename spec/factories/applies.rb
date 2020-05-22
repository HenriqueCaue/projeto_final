FactoryBot.define do
  factory :apply do
    why_apply { "Tenho 5 anos de experiência nas "\
      "tecnologias solicitadas e já trabalhei em "\
      "empresas do mesmo ramo de atuação." }
    job_opportunity
    candidate 
  end
end
