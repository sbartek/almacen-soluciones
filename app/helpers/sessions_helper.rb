module SessionsHelper

  def sign_in(usuario)
    remember_token = Usuario.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    usuario.update_attribute(:remember_token, Usuario.digest(remember_token))
    self.usuario_actual = usuario
  end

  def sign_out
    usuario_actual.update_attribute(:remember_token,
                                    Usuario.digest(Usuario.new_remember_token))
    cookies.delete(:remember_token)
    usuario_actual = nil
  end

  def signed_in?
    !usuario_actual.nil?
  end

  def usuario_actual=(usuario)
    @usuario_actual = usuario
  end

  def usuario_actual
    remember_token = Usuario.digest(cookies[:remember_token])
    @usuario_actual ||= Usuario.find_by(remember_token: remember_token)
  end
end
