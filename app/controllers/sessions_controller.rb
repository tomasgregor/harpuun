class SessionsController < ApplicationController
  
  def new  
  end
  
  def create
    @starter = Starter.find_by_email(params[:email])
    @client = Client.find_by_email(params[:email])
      if @starter && @starter.authenticate(params[:password])
        session[:starter_id] = @starter.id
        redirect_to starter_projects_url(@starter)
      elsif @client && @client.authenticate(params[:password])
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
    if current_starter
      session[:starter_id] = nil
      redirect_to root_url
    elsif current_client
      session[:client_id] = nil
      redirect_to root_url
    end
  end
  
end

