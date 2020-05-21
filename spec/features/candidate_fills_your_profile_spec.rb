require 'rails_helper'

feature 'Candidate fills your profile' do
  scenario 'login and go to form profile' do
    candidate = create(:candidate)

    visit new_candidate_session_path

    fill_in 'Email', with: candidate.email
    fill_in 'Senha', with: candidate.password
    click_on 'Entrar'

    click_on 'Perfil'

    expect(page).to have_content ('Criar perfil')
  end

  scenario 'succesfully' do
    candidate = create(:candidate)
    visit new_candidate_session_path

    fill_in 'Email', with: candidate.email
    fill_in 'Senha', with: candidate.password
    click_on 'Entrar'

    click_on 'Perfil'
    click_on 'Criar perfil'

    fill_in 'Nome', with: 'João da silva'
    fill_in 'Nome Social', with: 'Joana da silva'
    fill_in 'CPF', with: '111.496.136-10'
    fill_in 'Nascimento', with: '25/05/1999'
    fill_in 'Formação', with: 'Analista de Sistemas'
    fill_in 'Descrição', with: 'Estou em busca de novos desafios'
    fill_in 'Experiência', with: "Trabalho com isso há 3 anos. "\
    "Já trabalhei em algumas empresas internacionais."

    click_on 'Salvar'

    expect(current_path).to eq root_path
  end
end