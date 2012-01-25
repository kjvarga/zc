class AdminController < ApplicationController
  def index
  end
  
  def login
    if params[:email] != ENV['AUTH_EMAIL'] || Digest::SHA512.hexdigest(params[:password]) != ENV['AUTH_PASSWORD']
      flash.now[:error] = 'Incorrect email or password.  Access denied.'
      render :index
    else
      flash[:notice] = 'You have logged in successfully.'
      redirect_to images_url
    end
  end
end
