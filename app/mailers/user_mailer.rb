# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: ENV['USER_NAME']

  def send_email(email, chapter)
    @chapter = chapter
    mail(to: email, subject: "New chapter : #{chapter}")
  end
end
