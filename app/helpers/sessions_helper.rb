module SessionsHelper

  def sign_in(usuario)
    remember_token = Usuario.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    usuario.update_attribute(:remember_token, Usuario.digest(remember_token))
    self.usuario_actual = user
  end

end
