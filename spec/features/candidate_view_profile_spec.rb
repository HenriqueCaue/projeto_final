require 'rails_helper'

feature 'Candidate view profile' do
  scenario 'succesfully' do
    candidate = create(:candidate)
    profile = create(:profile, candidate: candidate)

    visit new_candidate_session_path

    fill_in 'Email', with: candidate.email
    fill_in 'Senha', with: candidate.password
    click_on 'Entrar'

    click_on 'Perfil'

    expect(page).to have_content('Nome: João da silva sauro')
    expect(page).to have_content('Nome Social: Joana da silva sauro')
    expect(page).to have_content('CPF: 111.496.136-10')
    expect(page).to have_content('Nascimento: 25/05/1999')
    expect(page).to have_content('Formação: Analista de Sistemas')
    expect(page).to have_content('Descrição: Estou em busca de novos desafios')
    expect(page).to have_content("Experiência: Trabalho com isso há 3 anos. "\
      "Já trabalhei em algumas empresas internacionais.")
    expect(page).to have_content("Email: #{candidate.email}")

    expect(page).to have_link('Editar perfil')
    expect(page).to have_link('Ver vagas')
  end

  scenario 'and return to job opportunities' do
    candidate = create(:candidate)
    profile = create(:profile, candidate: candidate)
    login_as candidate, scope: :candidate

    visit profiles_path

    click_on 'Ver vagas'

    expect(current_path).to eq root_path
  end
end
