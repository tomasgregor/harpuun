class ClientSessionsController < ApplicationController
  
  def new  
  end
  
  def create
    @client = Client.find_by_email(params[:email])
      if @client && @client.authenticate(params[:password])
        session[:client_id] = @client.id
        redirect_to client_url(session[:client_id]), notice: 'Catches are ready for your Harpuun!'
      else
        flash[:notice] = "Invalid email address or password"
        render 'new'
      end
  end
  
  def destroy
    session[:client_id] = nil
    redirect_to root_url
  end
  
end
