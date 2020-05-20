require 'rails_helper'

feature 'headhunter create job opportunity' do
  scenario 'succesfully' do
    headhunter = create(:headhunter)
    login_as headhunter, scope: :headhunter

    visit root_path

    click_on 'Cadastrar vagas'

    fill_in 'Título', with: 'Analista de sistemas'
    fill_in 'Local', with: 'Av. Paulista'
    fill_in 'Descrição', with: 'Atuar com ASP NET / Framework 4.0 (ou superior).
      Visual Studio. Suporte para usuários. Desenvolvimento de software.'
    fill_in 'Habilidades desejadas', with: 'Graduação em análise e 
      desenvolvimento de sistemas'
    fill_in 'Faixa salarial', with: 1100.50
    select 'Estagiário', from: 'Nível de experiência'
    fill_in 'Inscrições até', with: '25/05/2030'
    click_on 'Cadastrar vaga'

    expect(current_path).to eq job_opportunity_path(JobOpportunity.last.id)

    expect(page).to have_content('Analista de sistemas')
    expect(page).to have_content('Local: Av. Paulista')
    expect(page).to have_content('Descrição: Atuar com ASP NET / '\
      'Framework 4.0 (ou superior). Visual Studio. Suporte para usuários. '\
      'Desenvolvimento de software.')
    expect(page).to have_content('Habilidades desejadas: Graduação em '\
      'análise e desenvolvimento de sistemas')
    expect(page).to have_content('Faixa salarial: R$ 1.100,50')
    expect(page).to have_content('Nível de experiência: Estagiário')
    expect(page).to have_content("Inscrições até: 25/05/2030")
  end

  scenario 'and fill in all fields' do
    headhunter = create(:headhunter)
    login_as headhunter, scope: :headhunter

    visit root_path

    click_on 'Cadastrar vagas'

    click_on 'Cadastrar vaga'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Local não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Habilidades desejadas não pode ficar em branco')
    expect(page).to have_content('Faixa salarial não pode ficar em branco')
    expect(page).to have_content('Inscrições até não pode ficar em branco')
  end

  scenario 'and not is logged' do
    visit new_job_opportunity_path

    expect(current_path).to eq new_headhunter_session_path
  end
end