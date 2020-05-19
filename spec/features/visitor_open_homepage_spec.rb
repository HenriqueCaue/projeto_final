require 'rails_helper'

feature 'Visitor open homepage' do
  scenario 'succesfully' do
    visit root_path

    expect(page).to have_content('Bem vindo ao sistema de vagas de emprego')
  end
end