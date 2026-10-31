class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: [ :edit, :update, :destroy ]

  private

  def ensure_normal_user
    if current_user.guest?
      redirect_to profile_path, alert: "ゲストユーザーは、メールアドレス・パスワードの変更と退会はできません！"
    end
  end
end
