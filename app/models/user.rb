class User < ApplicationRecord
  require 'bcrypt'

  attr_accessor :raw_password, :raw_password_confirmation

  before_validation :confirm_password

  validates :nome, presence: true, length: { minimum: 6, message: "O nome deve ter no mínimo 6 caracteres" }
  validates :senha, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Não é um email válido" }, uniqueness: { case_sensitive: false, message: "já cadastrado" }

  # Autentica a senha usando BCrypt
  def authenticate(raw_password)
    BCrypt::Password.new(senha) == raw_password
  end

  before_save :downcase_email

  # Gera um token de redefinição de senha e define o tempo de expiração
  def generate_reset_password_token
    self.reset_password_token = SecureRandom.urlsafe_base64.to_s
    self.reset_password_token_expires_at = 2.hours.from_now
    save(validate: false) # Evita validações para que o token possa ser salvo
    UserMailer.reset_password_email(self).deliver_now
  end

  # Verifica se o token de redefinição ainda é válido
  def reset_password_token_valid?
    reset_password_token_expires_at && reset_password_token_expires_at > Time.current
  end

  # Invalida o token após o uso, garantindo que ele não possa ser reutilizado
  def invalidate_reset_password_token
    self.reset_password_token = nil
    self.reset_password_token_expires_at = nil
    save(validate: false) # Salva as mudanças sem validações
  end

  private

  # Transforma o e-mail em letras minúsculas antes de salvar
  def downcase_email
    self.email = email.downcase if email.present?
  end

  # Confirmação da senha antes de salvar
  def confirm_password
    if raw_password.present? && raw_password_confirmation.present? && raw_password == raw_password_confirmation
      self.senha = BCrypt::Password.create(raw_password)
    elsif raw_password.present?
      errors.add(:base, "As senhas não coincidem")
      throw(:abort)
    else
      errors.add(:base, "É preciso cadastrar uma senha")
      throw(:abort)
    end
  end
end
