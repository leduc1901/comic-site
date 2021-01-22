# frozen_string_literal: true

class Admin::StatsController < Admin::ApplicationController
  def index
    @users = User.count
    @mangas = Manga.count
    @comments = Comment.count
  end
end
