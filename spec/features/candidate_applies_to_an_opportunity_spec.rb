require 'rails_helper'

feature 'Candidate applies to an opportunity' do
  scenario 'and view button' do
    candidate = create(:candidate)
    profile = create(:profile, candidate: candidate)
    job = create(:job_opportunity)

    visit new_candidate_session_path

    fill_in 'Email', with: candidate.email
    fill_in 'Senha', with: candidate.password
    click_on 'Entrar'

    click_on job.title

    expect(page).to have_link('Candidatar-se')
  end

  scenario 'and click button' do
    candidate = create(:candidate)
    profile = create(:profile, candidate: candidate)
    job = create(:job_opportunity)

    login_as candidate, scope: :candidate
    visit root_path

    click_on job.title
    click_on 'Candidatar-se'

    expect(page).to have_content('Por que quer essa vaga?')
    expect(page).to have_link('Aplicar')
  end
end