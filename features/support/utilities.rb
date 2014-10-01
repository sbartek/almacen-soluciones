include SessionsHelper

def web_sign_in(usuario, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = Usuario.new_remember_token
    cookies[:remember_token] = remember_token
    usuario.update_attribute(:remember_token, Usuario.digest(remember_token))
  else
    visit signin_path
    within(:xpath, "//form[@action='/sessions']") do
      fill_in "Email",    with: usuario.email
      fill_in "Password", with: usuario.password
      click_button "Accede"
    end
  end
end
  
