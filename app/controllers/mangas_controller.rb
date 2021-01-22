# frozen_string_literal: true

class MangasController < ApplicationController
  before_action :set_locale

  def index
    @sort = params[:sort]
    @comments = Comment.last(7)
    return @mangas = Manga.all.includes(:chapters) if @sort.nil?

    if @sort == 'subcribe'
      return @mangas = current_user.mangas.includes(:chapters) if user_signed_in?

      return @mangas = Manga.none
    end
    @mangas = Manga.public_send params[:sort]
  end

  def show
    @manga = Manga.find(params[:id])
    view = @manga.views_count + 1
    @manga.update_attribute(:views_count, view)
    @comments = @manga.comments
    @comment = @manga.comments.build
  end

  def subcribe
    manga = Manga.find(params[:manga_id])
    if manga.users.exists? current_user.id
      current_user.subcribes.find(manga: manga).destroy
    else
      current_user.subcribes.create! manga: manga
      subcribe.destroy
    end
  end

  def like
    like = Like.find_like(params[:manga_id], params[:user_id]).first
    if like.nil?
      like = Like.new(manga_id: params[:manga_id], user_id: params[:user_id])
      like.save
    else
      like.destroy
    end
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
