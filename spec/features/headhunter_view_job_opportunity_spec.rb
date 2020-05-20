require 'rails_helper'

feature 'headhunter view job opportunity' do
  scenario 'succesfully' do
    headhunter = create(:headhunter)
    login_as headhunter, scope: :headhunter

    job = create(:job_opportunity)

    visit root_path
    
    expect(page).to have_link(job.title)
    expect(page).to have_content(I18n.l(job.deadline))
    expect(page).to have_content(job.location)
  end
  
  scenario 'and view details' do
    headhunter = create(:headhunter)
    login_as headhunter, scope: :headhunter

    job = create(:job_opportunity)

    visit root_path
    click_on job.title

    expect(page).to have_content('Analista de sistemas')
    expect(page).to have_content('Local: Av. Paulista')
    expect(page).to have_content('Descrição: Atuar com ASP NET / '\
      'Framework 4.0 (ou superior). Visual Studio. Suporte para usuários. '\
      'Desenvolvimento de software.')
    expect(page).to have_content('Habilidades desejadas: Graduação em '\
    'análise e desenvolvimento de sistemas.')
    expect(page).to have_content('Faixa salarial: R$ 1.100,50')
    expect(page).to have_content('Nível de experiência: Estagiário')
    expect(page).to have_content("Inscrições até: #{I18n.l(job.deadline)}")
  end

  scenario 'and no opportunities are created' do
    headhunter = create(:headhunter)
    login_as headhunter, scope: :headhunter

    visit root_path

    expect(page).to have_content('Nenhuma vaga criada')
  end
end