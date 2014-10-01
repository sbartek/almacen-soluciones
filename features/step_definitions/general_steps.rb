Cuando(/^hago click en el enlace "(.*?)" de la pagina inicial$/) do |nombre_enlace|
  usuario = FactoryGirl.create(:usuario)
  web_sign_in usuario
  visit '/'
  within(:xpath, '//div[@class="row"][1]') do
    click_link nombre_enlace
  end
end

Cuando(/^entro la pagina de la ficha "(.*?)"$/) do |nombre_ficha|
  usuario = FactoryGirl.create(:usuario)
  web_sign_in usuario
  visit '/'
  within(:xpath, '//div[@class="row"][1]') do
    click_link "Articulos"
  end
  click_link nombre_ficha
end

Entonces(/^aparece lista ?"?(.*?)"? de "(.*?)s?" que contiene enlace "(.*?)"$/) do |titulo_lista, model, nombre_enlace|
  expect(page).to have_content(titulo_lista)
  expect(page).to have_link nombre_enlace
end

Cuando(/^hago click en "(.*?)"$/) do |nombre_enlace|
  click_link nombre_enlace
end
