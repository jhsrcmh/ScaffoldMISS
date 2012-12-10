class CloseTypesController < ApplicationController
  # GET /close_types
  # GET /close_types.json
  def index
    @close_types = CloseType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @close_types }
    end
  end

  # GET /close_types/1
  # GET /close_types/1.json
  def show
    @close_type = CloseType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @close_type }
    end
  end

  # GET /close_types/new
  # GET /close_types/new.json
  def new
    @close_type = CloseType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @close_type }
    end
  end

  # GET /close_types/1/edit
  def edit
    @close_type = CloseType.find(params[:id])
  end

  # POST /close_types
  # POST /close_types.json
  def create
    @close_type = CloseType.new(params[:close_type])

    respond_to do |format|
      if @close_type.save
        format.html { redirect_to @close_type, notice: 'Close type was successfully created.' }
        format.json { render json: @close_type, status: :created, location: @close_type }
      else
        format.html { render action: "new" }
        format.json { render json: @close_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /close_types/1
  # PUT /close_types/1.json
  def update
    @close_type = CloseType.find(params[:id])

    respond_to do |format|
      if @close_type.update_attributes(params[:close_type])
        format.html { redirect_to @close_type, notice: 'Close type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @close_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /close_types/1
  # DELETE /close_types/1.json
  def destroy
    @close_type = CloseType.find(params[:id])
    @close_type.destroy

    respond_to do |format|
      format.html { redirect_to close_types_url }
      format.json { head :no_content }
    end
  end
end
