class SecurityProjTypesController < ApplicationController
  # GET /security_proj_types
  # GET /security_proj_types.json
  def index
    @security_proj_types = SecurityProjType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @security_proj_types }
    end
  end

  # GET /security_proj_types/1
  # GET /security_proj_types/1.json
  def show
    @security_proj_type = SecurityProjType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @security_proj_type }
    end
  end

  # GET /security_proj_types/new
  # GET /security_proj_types/new.json
  def new
    @security_proj_type = SecurityProjType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @security_proj_type }
    end
  end

  # GET /security_proj_types/1/edit
  def edit
    @security_proj_type = SecurityProjType.find(params[:id])
  end

  # POST /security_proj_types
  # POST /security_proj_types.json
  def create
    @security_proj_type = SecurityProjType.new(params[:security_proj_type])

    respond_to do |format|
      if @security_proj_type.save
        format.html { redirect_to @security_proj_type, notice: 'Security proj type was successfully created.' }
        format.json { render json: @security_proj_type, status: :created, location: @security_proj_type }
      else
        format.html { render action: "new" }
        format.json { render json: @security_proj_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /security_proj_types/1
  # PUT /security_proj_types/1.json
  def update
    @security_proj_type = SecurityProjType.find(params[:id])

    respond_to do |format|
      if @security_proj_type.update_attributes(params[:security_proj_type])
        format.html { redirect_to @security_proj_type, notice: 'Security proj type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @security_proj_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_proj_types/1
  # DELETE /security_proj_types/1.json
  def destroy
    @security_proj_type = SecurityProjType.find(params[:id])
    @security_proj_type.destroy

    respond_to do |format|
      format.html { redirect_to security_proj_types_url }
      format.json { head :no_content }
    end
  end
end
