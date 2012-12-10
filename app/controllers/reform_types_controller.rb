class ReformTypesController < ApplicationController
  # GET /reform_types
  # GET /reform_types.json
  def index
    @reform_types = ReformType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reform_types }
    end
  end

  # GET /reform_types/1
  # GET /reform_types/1.json
  def show
    @reform_type = ReformType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reform_type }
    end
  end

  # GET /reform_types/new
  # GET /reform_types/new.json
  def new
    @reform_type = ReformType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reform_type }
    end
  end

  # GET /reform_types/1/edit
  def edit
    @reform_type = ReformType.find(params[:id])
  end

  # POST /reform_types
  # POST /reform_types.json
  def create
    @reform_type = ReformType.new(params[:reform_type])

    respond_to do |format|
      if @reform_type.save
        format.html { redirect_to @reform_type, notice: 'Reform type was successfully created.' }
        format.json { render json: @reform_type, status: :created, location: @reform_type }
      else
        format.html { render action: "new" }
        format.json { render json: @reform_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reform_types/1
  # PUT /reform_types/1.json
  def update
    @reform_type = ReformType.find(params[:id])

    respond_to do |format|
      if @reform_type.update_attributes(params[:reform_type])
        format.html { redirect_to @reform_type, notice: 'Reform type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reform_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reform_types/1
  # DELETE /reform_types/1.json
  def destroy
    @reform_type = ReformType.find(params[:id])
    @reform_type.destroy

    respond_to do |format|
      format.html { redirect_to reform_types_url }
      format.json { head :no_content }
    end
  end
end
