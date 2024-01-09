class SplashController < ApplicationController
  skip_before_action :authenticate_user!

  def splash
    return unless user_signed_in?

    redirect_to payments_path
  end
end
