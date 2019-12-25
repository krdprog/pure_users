class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
