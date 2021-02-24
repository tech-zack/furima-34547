class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email,uniqueness: true
         validates :password, format: {with:/\A[a-zA-Z0-9]+\z/}
         validates :nickname,presence: true
         
         with_options format: {with:/\A[ぁ-んァ-ヶ一-龥]+\z/} do
          validates :first_name,presence: true
          validates :last_name,presence: true
         end
         
         with_options format: {with:/\A[ァ-ヶー－]+\z/} do
          validates :first_name_hurigana,presence: true
          validates :last_name_hurigana,presence: true
        end
         
        validates :date,presence: true

         has_many :items
         has_many :orders
end
