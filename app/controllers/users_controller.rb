# frozen_string_literal: true

class UsersController < ApplicationController
  def edit; end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      @user.avatar.attach(params[:avatar]) unless params[:avatar].nil?
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :avatar)
  end
end
