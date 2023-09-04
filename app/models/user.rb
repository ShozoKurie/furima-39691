class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX_JP = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_PASSWORD_REGEX_KKANA = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: VALID_PASSWORD_REGEX_JP }
  validates :first_name, presence: true, format: { with: VALID_PASSWORD_REGEX_JP }
  validates :last_name_kana, presence: true, format: { with: VALID_PASSWORD_REGEX_KKANA }
  validates :first_name_kana, presence: true, format: { with: VALID_PASSWORD_REGEX_KKANA }
  validates :birthday, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # has_many :items
  # has_many :purchases
end
