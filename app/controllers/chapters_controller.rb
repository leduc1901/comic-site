# frozen_string_literal: true

class ChaptersController < ApplicationController
  def show
    @manga = Manga.find(params[:manga_id])
    @chapter = @manga.chapters.find(params[:id])
    @prev = @chapter.previous
    @prev ||= @chapter.id
    @next = @chapter.next
    @next = @chapter.id if @next.nil?
  end
end
