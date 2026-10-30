class GuestSessionsController < ApplicationController
  def create
    user = User.guest
    sign_in user
    redirect_to home_path, notice: "ゲストとしてログインしました"
  end
end
