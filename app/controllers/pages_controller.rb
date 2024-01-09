class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def splash
    return unless user_signed_in?

    redirect_to groups_path
  end
end
