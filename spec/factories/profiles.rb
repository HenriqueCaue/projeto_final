FactoryBot.define do
  factory :profile do
    name { "João da silva sauro" }
    birthday { "25/05/1999" }
    social_name { "Joana da silva sauro" }
    document { "111.496.136-10" }
    formation { " Analista de Sistemas" }
    description { "Estou em busca de novos desafios" }
    experience { "Trabalho com isso há 3 anos. 
      Já trabalhei em algumas empresas internacionais." }
    candidate
  end
end
