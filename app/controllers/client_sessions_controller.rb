class ClientSessionsController < ApplicationController
  
  def new  
  end
  
  def create
    @client = Client.find_by_email(params[:email])
      if @client && @client.authenticate(params[:password])
        session[:client_id] = @client.id
        if @client.projects.any?
          redirect_to client_projects_url(@client)
        else
          redirect_to new_client_project_url(@client)
        end
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
