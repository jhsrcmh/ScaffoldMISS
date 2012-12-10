class CheckClassesController < ApplicationController
  # GET /check_classes
  # GET /check_classes.json
  def index
    @check_classes = CheckClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @check_classes }
    end
  end

  # GET /check_classes/1
  # GET /check_classes/1.json
  def show
    @check_class = CheckClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @check_class }
    end
  end

  # GET /check_classes/new
  # GET /check_classes/new.json
  def new
    @check_class = CheckClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @check_class }
    end
  end

  # GET /check_classes/1/edit
  def edit
    @check_class = CheckClass.find(params[:id])
  end

  # POST /check_classes
  # POST /check_classes.json
  def create
    @check_class = CheckClass.new(params[:check_class])

    respond_to do |format|
      if @check_class.save
        format.html { redirect_to @check_class, notice: 'Check class was successfully created.' }
        format.json { render json: @check_class, status: :created, location: @check_class }
      else
        format.html { render action: "new" }
        format.json { render json: @check_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /check_classes/1
  # PUT /check_classes/1.json
  def update
    @check_class = CheckClass.find(params[:id])

    respond_to do |format|
      if @check_class.update_attributes(params[:check_class])
        format.html { redirect_to @check_class, notice: 'Check class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @check_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_classes/1
  # DELETE /check_classes/1.json
  def destroy
    @check_class = CheckClass.find(params[:id])
    @check_class.destroy

    respond_to do |format|
      format.html { redirect_to check_classes_url }
      format.json { head :no_content }
    end
  end
end
