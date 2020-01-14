class User < ApplicationRecord
  before_save { self.email = email.downcase }

  mount_uploader :avatar, AvatarUploader

  validates :name, :email, :avatar, :password_digest, presence: true
  validates :email, uniqueness: { case_sensitive: true }
  validates :email, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: "Неправильный формат e-mail адреса" }
  validates :password, length: { minimum: 6, maximum: 72, message: "Неправильная длина пароля. Правильно: от 6 до 72 знаков." }

  has_secure_password
end
