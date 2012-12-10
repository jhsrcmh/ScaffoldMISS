class EverydaycheckTypesController < ApplicationController
  # GET /everydaycheck_types
  # GET /everydaycheck_types.json
  def index
    @everydaycheck_types = EverydaycheckType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @everydaycheck_types }
    end
  end

  # GET /everydaycheck_types/1
  # GET /everydaycheck_types/1.json
  def show
    @everydaycheck_type = EverydaycheckType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @everydaycheck_type }
    end
  end

  # GET /everydaycheck_types/new
  # GET /everydaycheck_types/new.json
  def new
    @everydaycheck_type = EverydaycheckType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @everydaycheck_type }
    end
  end

  # GET /everydaycheck_types/1/edit
  def edit
    @everydaycheck_type = EverydaycheckType.find(params[:id])
  end

  # POST /everydaycheck_types
  # POST /everydaycheck_types.json
  def create
    @everydaycheck_type = EverydaycheckType.new(params[:everydaycheck_type])

    respond_to do |format|
      if @everydaycheck_type.save
        format.html { redirect_to @everydaycheck_type, notice: 'Everydaycheck type was successfully created.' }
        format.json { render json: @everydaycheck_type, status: :created, location: @everydaycheck_type }
      else
        format.html { render action: "new" }
        format.json { render json: @everydaycheck_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /everydaycheck_types/1
  # PUT /everydaycheck_types/1.json
  def update
    @everydaycheck_type = EverydaycheckType.find(params[:id])

    respond_to do |format|
      if @everydaycheck_type.update_attributes(params[:everydaycheck_type])
        format.html { redirect_to @everydaycheck_type, notice: 'Everydaycheck type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @everydaycheck_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /everydaycheck_types/1
  # DELETE /everydaycheck_types/1.json
  def destroy
    @everydaycheck_type = EverydaycheckType.find(params[:id])
    @everydaycheck_type.destroy

    respond_to do |format|
      format.html { redirect_to everydaycheck_types_url }
      format.json { head :no_content }
    end
  end
end
