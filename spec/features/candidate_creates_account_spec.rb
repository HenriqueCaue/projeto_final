require 'rails_helper'

feature 'candidate creates account' do
  context 'view form' do
    scenario 'and view form' do
      visit new_candidate_session_path
      click_on 'Cadastre-se' 

      expect(page).to have_content('Email')
      expect(page).to have_content('Senha')
      expect(page).to have_content('Confirme a senha')
    end

    scenario 'succesfully' do
      visit new_candidate_session_path
      click_on 'Cadastre-se'

      fill_in 'Email', with: 'candidate@teste.com'
      fill_in 'Senha', with: '123456789'
      fill_in 'Confirme a senha', with: '123456789'
      click_on 'Cadastrar'

      expect(page).to have_content ('Login efetuado com sucesso')
      expect(page).not_to have_link('Cadastrar vagas')
    end
  end
  
  context 'authentication' do
    scenario 'and login' do
      candidate = create(:candidate)

      visit new_candidate_session_path
      
      fill_in 'Email', with: candidate.email
      fill_in 'Senha', with: candidate.password
      click_on 'Entrar'

      expect(page).to have_content("Login efetuado com sucesso")
      expect(page).not_to have_link('Cadastrar vagas')
    end
  end
  
  context 'create valid' do
    scenario 'and password and password confirmation dont match' do
      visit new_candidate_session_path
      click_on 'Cadastre-se'

      fill_in 'Email', with: 'candidate@teste.com'
      fill_in 'Senha', with: '123456789'
      fill_in 'Confirme a senha', with: '12345678'
      click_on 'Cadastrar'

      expect(page).to have_content("não é igual a")
    end

    scenario 'and the email already exists' do
      candidate = create(:candidate, email: 'candidate@teste.com')
      visit new_candidate_session_path
      click_on 'Cadastre-se'

      fill_in 'Email', with: 'candidate@teste.com'
      fill_in 'Senha', with: '123456789'
      fill_in 'Confirme a senha', with: '123456789'
      click_on 'Cadastrar'

      expect(page).to have_content("já está em uso")
    end

    scenario 'and cant be blank' do
      visit new_candidate_session_path
      click_on 'Cadastre-se'

      fill_in 'Email', with: ''
      fill_in 'Senha', with: ''
      fill_in 'Confirme a senha', with: ''
      click_on 'Cadastrar'

      expect(page).to have_content("não pode ficar em branco")
    end
  end
end