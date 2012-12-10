class BackupTypesController < ApplicationController
  # GET /backup_types
  # GET /backup_types.json
  def index
    @backup_types = BackupType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @backup_types }
    end
  end

  # GET /backup_types/1
  # GET /backup_types/1.json
  def show
    @backup_type = BackupType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @backup_type }
    end
  end

  # GET /backup_types/new
  # GET /backup_types/new.json
  def new
    @backup_type = BackupType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @backup_type }
    end
  end

  # GET /backup_types/1/edit
  def edit
    @backup_type = BackupType.find(params[:id])
  end

  # POST /backup_types
  # POST /backup_types.json
  def create
    @backup_type = BackupType.new(params[:backup_type])

    respond_to do |format|
      if @backup_type.save
        format.html { redirect_to @backup_type, notice: 'Backup type was successfully created.' }
        format.json { render json: @backup_type, status: :created, location: @backup_type }
      else
        format.html { render action: "new" }
        format.json { render json: @backup_type.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /backup_types/1
  # PUT /backup_types/1.json
  def update
    @backup_type = BackupType.find(params[:id])

    respond_to do |format|
      if @backup_type.update_attributes(params[:backup_type])
        format.html { redirect_to @backup_type, notice: 'Backup type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @backup_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backup_types/1
  # DELETE /backup_types/1.json
  def destroy
    @backup_type = BackupType.find(params[:id])
    @backup_type.destroy

    respond_to do |format|
      format.html { redirect_to backup_types_url }
      format.json { head :no_content }
    end
  end
end
