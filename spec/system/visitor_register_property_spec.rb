require 'rails_helper'

describe 'Visitor register property' do
  it 'Successfuly' do
    #Arrange
    PropertyType.create!(name:'Casa')
    #Act
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'casa com quital em Copacabana'
    fill_in 'Descrição', with: 'Exelente casa, recém reformada com 2 vagas de garagem'
    fill_in 'Quartos', with: '5'
    fill_in 'Banheiros' ,with:'2'
    check 'Vaga de Estacionamento'     
    check 'Aceita Pets'
    fill_in 'Diária', with: '500'
    select 'Casa', from: 'Tipo'
    click_on 'Enviar'
    #Assert
    expect(page).to have_text("casa com quital em Copacabana")
    expect(page).to have_text("Exelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_text("Quartos: 5")
    expect(page).to have_text("Banheiros: 2")
    expect(page).to have_text("Aceita Pets: Sim")
    expect(page).to have_text("Estacionamento: Sim")
    expect(page).to have_text("Diária: R$ 500")
  end

  it 'and must fill all fields' do
    # testar dados em branco
    #Act
    visit root_path
    click_on 'Cadastrar Imóvel' 
    click_on 'Enviar' 

    #Assert
    expect(page).to have_content('não pode ficar em branco', count: 5)
    # expect(page).to have_content("Título não pode ficar em branco")
    # expect(page).to have_content("Descrição não pode ficar em branco")
    # expect(page).to have_content("Quartos não pode ficar em branco")
    # expect(page).to have_content("Banheiros não pode ficar em branco")
    # expect(page).to have_content("Diária não pode ficar em branco")
    expect(Property.count).to eq(0)
  end
end