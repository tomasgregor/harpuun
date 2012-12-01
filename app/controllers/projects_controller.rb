class ProjectsController < ApplicationController
  
  before_filter :require_client, :except => index_starter
  
  def require_client
    if current_client.nil? || current_client.id != params[:client_id].to_i
      redirect_to root_url, :notice => "You're not authorized to see this page"
      return
    end
  end
  
  def index
    # later add db filter .where(client_id=current_client.id)
    @client = current_client
    @projects = @client.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def index_starter
    @starter = current_starter
    @offered_project = Project.find_all_by_offered_to(@starter.id)
    @projects = Project.where(:accepted_by => @starter.id)
  end
  
  
  
  # GET /projects/1
  # GET /projects/1.json
  def show
    @client = current_client
    @project = current_client.projects.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @client = current_client
    @project = current_client.projects.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @client = current_client
    @project = current_client.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
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

  # PUT /projects/1
  # PUT /projects/1.json
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

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @client = current_client
    @project = current_client.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to client_projects_url(@client) }
      format.json { head :no_content }
    end
  end
  
end
