# frozen_string_literal: true

class Subcribe < ApplicationRecord
  belongs_to :manga
  belongs_to :user
  validates :manga_id, presence: true
  validates :user_id, presence: true
end
