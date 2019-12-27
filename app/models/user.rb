class User < ApplicationRecord
  before_save { self.email = email.downcase }

  mount_uploader :avatar, AvatarUploader

  validates :name, :email, :avatar, presence: true
  validates :email, uniqueness: { case_sensitive: true }
end
