require 'rails_helper'

describe 'Visitor visit home page' do
  it 'and views properties' do
    # Arrange => Preaparar (os dados)
    Property.create({
        title:'casa com quital em Copacabana',
        description:'Exelente casa, recém reformada com 2 vagas de garagem',
        rooms: 5
    })

    Property.create({
        title:'Apartamento com varanda em Salvador',
        description:'Exelente Apartamento, churrasqueira e sauna privada',
        rooms: 8,
        parking_slot:false
    })

    # Act => Agir (Execultar a funcionalidade )
    visit root_path

    # Assert => Garantir (que algo aconteça ou não aconteça)
    # 2 imaveis -> casa em  capo cabana; apartamento em manaus
    expect(page).to have_text("casa com quital em Copacabana")
    expect(page).to have_text("Exelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_text("Quartos: 5")
    expect(page).to have_text("Apartamento com varanda em Salvador")
    expect(page).to have_text("Exelente Apartamento, churrasqueira e sauna privada")
    expect(page).to have_text("Quartos: 8")
  end

  it 'and theres not property avaliable' do
    visit root_path
    expect(page).to have_text("Nenhum imóvel disponível")
  end

  it 'and view property details' do
    # Arrange => Preaparar (os dados)
    Property.create({
        title:'casa com quital em Copacabana',
        description:'Exelente casa, recém reformada com 2 vagas de garagem',
        rooms: 5,
        parking_slot:false,
        bathroom:2,
        pets:true,
        daily_rate: 500
    }) 

    visit root_path
    click_on 'casa com quital em Copacabana'

    expect(page).to have_text("casa com quital em Copacabana")
    expect(page).to have_text("Exelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_text("Quartos: 5")
    expect(page).to have_text("Banheiros: 2")
    expect(page).to have_text("Aceita Pets: Sim")
    expect(page).to have_text("Estacionamento: Não")
    expect(page).to have_text("Diária: R$ 500")
  end
end