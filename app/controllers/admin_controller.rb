class AdminController < ApplicationController
  def login
    @login = Login.new(params[:login])
    if request.post? && @login.valid?
      Session.destroy_all
      Session.create(:session_id => session[:session_id])
      flash[:notice] = 'You have logged in successfully.'
      redirect_to admin_url
    else
      render :login, :layout => 'application'
    end
  end

  def logout
    Session.destroy_all
    redirect_to root_path
  end
end
