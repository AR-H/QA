class SessionsController < ApplicationController

  def new
  
  end
  
   def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      flash[:success] = t('controllers.sessions.create.flash.success')
      redirect_back_or root_path
    else
      flash.now[:error] = t('controllers.sessions.create.flash.error')
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
