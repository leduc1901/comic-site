# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :subcribes
  has_many :mangas, through: :subcribes
  has_one_attached :avatar
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true, length: { minimum: 6, maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 5, maximum: 50 }, on: :create
end
