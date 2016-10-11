# frozen_string_literal: true
class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :ratings
  has_many :figures

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, presence: true
  validates :email, presence: true, length: { minimum: 6, maximum: 30 }, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def admin?
    role == "admin"
  end

  def name
    "#{first_name} #{last_name}"
  end

end
