require 'rails_helper'

feature 'headhunter creates account' do
  context 'create and view buttons' do
    scenario 'view form' do
      visit new_headhunter_session_path
      click_on 'Cadastre-se' 

      expect(page).to have_content('Email')
      expect(page).to have_content('Senha')
      expect(page).to have_content('Confirme a senha')
    end

    scenario 'succesfully' do
      visit new_headhunter_session_path
      click_on 'Cadastre-se'

      fill_in 'Email', with: 'headhunter@teste.com'
      fill_in 'Senha', with: '123456789'
      fill_in 'Confirme a senha', with: '123456789'
      click_on 'Cadastrar'

      expect(page).to have_content("Login efetuado com sucesso.")
      expect(page).to have_link('Cadastrar vagas')
    end
  end

  context 'create valid' do
    scenario 'and password and password confirmation dont match' do
      visit new_headhunter_session_path
      click_on 'Cadastre-se'

      fill_in 'Email', with: 'headhunter@teste.com'
      fill_in 'Senha', with: '123456789'
      fill_in 'Confirme a senha', with: '12345678'
      click_on 'Cadastrar'

      expect(page).to have_content("não é igual a")
    end

    scenario 'and the email already exists' do
      headhunter = Headhunter.create!(email: 'headhunter@teste.com', password: '123456789')
      visit new_headhunter_session_path
      click_on 'Cadastre-se'

      fill_in 'Email', with: 'headhunter@teste.com'
      fill_in 'Senha', with: '123456789'
      fill_in 'Confirme a senha', with: '123456789'
      click_on 'Cadastrar'

      expect(page).to have_content("já está em uso")
    end

    scenario 'and cant be blank' do
      visit new_headhunter_session_path
      click_on 'Cadastre-se'

      fill_in 'Email', with: ''
      fill_in 'Senha', with: ''
      fill_in 'Confirme a senha', with: ''
      click_on 'Cadastrar'

      expect(page).to have_content("não pode ficar em branco")
    end
  end
end