class StaticPagesController < ApplicationController
  def home
  end

  def secret
    if ! logged_in?
      flash[:danger] = 'hey login-toi pour y accéder'
      redirect_to login_path
    end
  end
end
