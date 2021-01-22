# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :manga

  scope :find_like, ->(manga_id, user_id) { where('manga_id = ? AND user_id = ?', manga_id, user_id) }
end
