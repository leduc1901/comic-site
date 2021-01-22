# frozen_string_literal: true

class Chapter < ApplicationRecord
  after_create :send_email_to_subcribers
  belongs_to :manga
  has_many_attached :photos

  validates :manga_id, presence: true
  validates :name, presence: true

  def previous
    Chapter.where('manga_id = ? AND id < ?', manga.id, id).last
  end

  def next
    Chapter.where('manga_id = ? AND id > ?', manga.id, id).first
  end

  private

  def send_email_to_subcribers
    manga = Manga.find(manga_id)
    manga.users.each do |user|
      UserMailer.send_email(user.email, name).deliver_now
    end
  end
end
