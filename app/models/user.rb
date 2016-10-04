class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :email, presence: true, length: { minimum: 6, maximum: 20 }, uniqueness: true
         validates :first_name, presence: true
         validates :last_name, presence: true
end
