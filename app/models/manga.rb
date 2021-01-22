# frozen_string_literal: true

class Manga < ApplicationRecord
  enum status: { completed: 'completed', ongoing: 'ongoing' }
  has_many :chapters, -> { order(id: :asc) }
  has_many :comments
  has_many :likes
  belongs_to :author, optional: true
  has_many :manga_categories
  has_many :categories, through: :manga_categories
  has_many :subcribes
  has_many :users, through: :subcribes
  has_one_attached :cover

  validates :name, presence: true
  validates :views_count, presence: true
  validates :status, presence: true

  scope :date, -> { includes(:chapters).order('chapters.created_at desc') }
  scope :chap, lambda {
    left_joins(:chapters)
      .group(:id)
      .order('COUNT(chapters.id) DESC')
  }
  scope :find_name, -> { order(name: 'asc').includes(:chapters) }
end
