class StarterSessionsController < ApplicationController
  
  def new  
  end
  
  def create
    @starter = Starter.find_by_email(params[:email])
      if @starter && @starter.authenticate(params[:password])
        session[:starter_id] = @starter.id
        redirect_to starter_url(session[:starter_id]), notice: 'You are logged in!'
      else
        flash[:notice] = "Invalid email address or password"
        render 'new'
      end
  end
  
  def destroy
    session[:starter_id] = nil
    redirect_to root_url
  end
  
end
