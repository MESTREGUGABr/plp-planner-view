class User < ApplicationRecord
  # belongs_to :plannerView
  require 'bcrypt'

  #Atributos vituais
  attr_accessor :raw_password_confirmation
  attr_accessor :raw_password

  before_validation :confirm_password

  # Validações, relacionamentos e métodos podem ser adicionados aqui
  validates :nome, presence: true, length: {minimum: 6, message: "O nome deve ter no mínimo 6 caracteres"}
  validates :senha, presence: true
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Não é um email válido"}, uniqueness: { case_sensitive: false, message: " já cadastrado" }

  def authenticate(raw_password)
    BCrypt::Password.new(senha) == raw_password
  end

  private

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