class GuestSessionsController < ApplicationController
  def create
    user = User.guest
    user.reset_guest_data!
    sign_in user
    redirect_to home_path, notice: "ゲストとしてログインしました"
  end
end
