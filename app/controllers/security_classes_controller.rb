class SecurityClassesController < ApplicationController
  # GET /security_classes
  # GET /security_classes.json
  def index
    @security_classes = SecurityClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @security_classes }
    end
  end

  # GET /security_classes/1
  # GET /security_classes/1.json
  def show
    @security_class = SecurityClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @security_class }
    end
  end

  # GET /security_classes/new
  # GET /security_classes/new.json
  def new
    @security_class = SecurityClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @security_class }
    end
  end

  # GET /security_classes/1/edit
  def edit
    @security_class = SecurityClass.find(params[:id])
  end

  # POST /security_classes
  # POST /security_classes.json
  def create
    @security_class = SecurityClass.new(params[:security_class])

    respond_to do |format|
      if @security_class.save
        format.html { redirect_to @security_class, notice: 'Security class was successfully created.' }
        format.json { render json: @security_class, status: :created, location: @security_class }
      else
        format.html { render action: "new" }
        format.json { render json: @security_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /security_classes/1
  # PUT /security_classes/1.json
  def update
    @security_class = SecurityClass.find(params[:id])

    respond_to do |format|
      if @security_class.update_attributes(params[:security_class])
        format.html { redirect_to @security_class, notice: 'Security class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @security_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_classes/1
  # DELETE /security_classes/1.json
  def destroy
    @security_class = SecurityClass.find(params[:id])
    @security_class.destroy

    respond_to do |format|
      format.html { redirect_to security_classes_url }
      format.json { head :no_content }
    end
  end
end
