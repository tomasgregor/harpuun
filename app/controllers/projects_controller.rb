class ProjectsController < ApplicationController
  
  before_filter :require_client, :only => [:index, :new, :show, :update, :create, :destroy]
  
  def require_client
    if current_client.nil? || current_client.id != params[:client_id].to_i
      redirect_to root_url, :notice => "You're not authorized to see this page"
      return
    end
  end
  
  
# Actions for projects related to Client
  
  def index
    @client = current_client
    @projects = @client.projects
    @actual_projects = @client.projects.where("actual_starter_id IS NOT NULL")
    @offered_projects = @client.projects.where("actual_starter_id IS NULL and completer_id IS NULL")
    @completed_projects = @client.projects.where("completer_id IS NOT NULL")
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end


  
  def show
    @client = current_client
    @project = current_client.projects.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end
  
  def new
    @client = current_client
    @project = current_client.projects.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  def edit
    @client = current_client
    @project = current_client.projects.find(params[:id])
  end

  def create
    @client = current_client
    @project = current_client.projects.build(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to [@client, @project], notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @client = current_client
    @project = current_client.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to [@client, @project], notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client = current_client
    @project = current_client.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to client_projects_url(@client) }
      format.json { head :no_content }
    end
  end
  
  
#   Actions for projects related to Starters
  
  def index_starter
    @starter = current_starter
    @offered_project = offered_project
    @projects = Project.where(:accepted_by => @starter.id)
    
    respond_to do |format|
      format.html # starter.html.erb
      format.json { render json: @projects }
    end
  end
  
  def show_starter_offered
    @starter = current_starter
    @offered_project = offered_project
    @client = @offered_project.client
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end
  
  def accept_project
    if offered_project.update_attributes(offered_to: nil, accepted_by: current_starter.id)
      redirect_to starter_projects_url(@starter)
    else
      render 'show_starter_offered'
    end
  end
  
  def reject_project
    if offered_project.update_attributes(offered_to: nil)
      redirect_to starter_projects_url(@starter)
    else
      render 'show_starter_offered'
    end
  end
  
end
