# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      @comment.save
      format.js {}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:manga_id, :user_id, :content)
  end
end
