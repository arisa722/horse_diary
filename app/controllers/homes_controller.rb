class HomesController < ApplicationController
  before_action :authenticate_user!, only: [ :home ]
  def top
    redirect_to home_path if user_signed_in?
  end

  def home
    @recent_lessons = current_user.lessons.order(date: :desc).limit(3)
    @last_lesson = @recent_lessons.first
  end
end
