<<<<<<< HEAD
class User < ActiveRecord::Base
  has_many :ratings
  has_many :votes

  validates :name, presence: true

=======
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :email, presence: true, length: { minimum: 6, maximum: 30 }, uniqueness: true
   validates :first_name, presence: true
   validates :last_name, presence: true
>>>>>>> e6e9e757a80642fdc1d5072ec3fd95b3f5178e05
end
