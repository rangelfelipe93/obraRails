# coding: utf-8

require 'spec_helper'
require 'spec_helper'

feature 'gerenciar proprietario' do

  scenario 'incluir proprietario', :javascript => true  do

    visit new_proprietario_path

    preencher_e_verificar_proprietario
 

  end

  scenario 'alterar proprietario' do #, :js => true  do

    proprietario = FactoryGirl.create(:proprietario)

    visit edit_proprietario_path(proprietario)

    preencher_e_verificar_proprietario



  end

   scenario 'excluir proprietario' do #, :javascript => true  do

       proprietario = FactoryGirl.create(:proprietario)

        visit proprietarios_path

        click_link 'Excluir'

    

  end

   def preencher_e_verificar_proprietario

      fill_in 'Nome',  :with => "Luiz"
      fill_in 'Idade', :with => "40"
      fill_in 'Sexo', :with => "M"
      fill_in 'Rua', :with => "Rua dos Bobos"
      fill_in 'Número', :with => "40"
      fill_in 'Complemento', :with => "casa 77"
      fill_in 'CPF', :with => "123456789"
 
      click_button 'Salvar'

      page.should have_content 'Nome: Luiz'
      page.should have_content 'Idade: 40'
      page.should have_content 'Sexo: M'
      page.should have_content 'Rua: Rua dos Bobos'
      page.should have_content 'Número: 40'
      page.should have_content 'Complemento: casa 77'
      page.should have_content 'CPF: 123456789'

      

   end
end
