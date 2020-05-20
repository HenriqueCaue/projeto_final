require 'rails_helper'

feature 'Visitor open homepage' do
  scenario 'succesfully' do
    visit root_path

    expect(page).to have_content('Bem vindo ao sistema de vagas de emprego')
  end

  scenario 'and try to apply' do
    job = create(:job_opportunity)

    visit root_path
    click_on job.title

    click_on 'Candidatar-se'

    expect(current_path).to eq new_candidate_session_path
  end
end