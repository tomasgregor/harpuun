class ContractorsController < ApplicationController

  before_filter :require_contractor, :except => [:index, :new, :create]
  
  def require_contractor
    if current_contractor.id != params[:id].to_i
      redirect_to root_url, :notice => "You're not authorized to see this page"
      return
    end
  end

  # GET /contractors
  # GET /contractors.json
  def index
    @contractors = Contractor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contractors }
    end
  end

  # GET /contractors/1
  # GET /contractors/1.json
  def show
    @contractor = Contractor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contractor }
    end
  end

  # GET /contractors/new
  # GET /contractors/new.json
  def new
    @contractor = Contractor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contractor }
    end
  end

  # GET /contractors/1/edit
  def edit
    @contractor = Contractor.find(params[:id])
  end

  # POST /contractors
  # POST /contractors.json
  def create
    @contractor = Contractor.new(params[:contractor])

    respond_to do |format|
      if @contractor.save
        session[:contractor_id] = @contractor.id
        format.html { redirect_to @contractor, notice: 'Contractor was successfully created.' }
        format.json { render json: @contractor, status: :created, location: @contractor }
      else
        format.html { render action: "new" }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contractors/1
  # PUT /contractors/1.json
  def update
    @contractor = Contractor.find(params[:id])

    respond_to do |format|
      if @contractor.update_attributes(params[:contractor])
        format.html { redirect_to @contractor, notice: 'Contractor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractors/1
  # DELETE /contractors/1.json
  def destroy
    @contractor = Contractor.find(params[:id])
    @contractor.destroy

    respond_to do |format|
      format.html { redirect_to contractors_url }
      format.json { head :no_content }
    end
  end
end
