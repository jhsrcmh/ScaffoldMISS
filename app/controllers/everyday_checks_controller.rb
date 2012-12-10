class EverydayChecksController < ApplicationController
  # GET /everyday_checks
  # GET /everyday_checks.json
  def index
    @everyday_checks = EverydayCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @everyday_checks }
    end
  end

  # GET /everyday_checks/1
  # GET /everyday_checks/1.json
  def show
    
    # download作为id下载相应的文件。
    require 'helpers/File'
    if params[:id] == 'download'
      download(params[:filename], 'everydaycheck')
    else
      @everyday_check = EverydayCheck.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @everyday_check }
      end
    end
  end

  # GET /everyday_checks/new
  # GET /everyday_checks/new.json
  def new
    @everyday_check = EverydayCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @everyday_check }
    end
  end

  # GET /everyday_checks/1/edit
  def edit
    @everyday_check = EverydayCheck.find(params[:id])
  end

  # POST /everyday_checks
  # POST /everyday_checks.json
  def create
    # 获得客户端userid 和 project_id, everydaycheck_id以及上传的文件类型.
    require 'helpers/File'
    params[:everyday_check][:project_id] = params[:project][:projname]
    params[:everyday_check][:user_id] = params[:user][:username]
    params[:everyday_check][:everydaycheck_id] = params[:everydaycheck_type][:everydaychecktype]
    file_temp = params[:img_file]  
    params[:everyday_check][:everydaycheckform], params[:everyday_check][:file_path] = upload(file_temp, 'everydaycheck')
    @everyday_check = EverydayCheck.new(params[:everyday_check])

    respond_to do |format|
      if @everyday_check.save
        format.html { redirect_to @everyday_check, notice: 'Everyday check was successfully created.' }
        format.json { render json: @everyday_check, status: :created, location: @everyday_check }
      else
        format.html { render action: "new" }
        format.json { render json: @everyday_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /everyday_checks/1
  # PUT /everyday_checks/1.json
  def update
    @everyday_check = EverydayCheck.find(params[:id])

    respond_to do |format|
      # 获得客户端userid 和 project_id, everydaycheck_id以及上传的文件类型.
      require 'helpers/File'
      params[:everyday_check][:project_id] = params[:project][:projname]
      params[:everyday_check][:user_id] = params[:user][:username]
      params[:everyday_check][:everydaycheck_id] = params[:everydaycheck_type][:everydaychecktype]
      
      #每次上传的时候存在一个问题，就是必须判定params[:img_file]是否存在，如果存在，必须得删除原来的file
      file_temp = params[:img_file]
      
      #判定上传文件是否为空，为空，则不进行attribute_update,我们在程序模拟中必须注意到程序本身带来的不好的地方。
      if file_temp != nil
        params[:everyday_check][:everydaycheckform], params[:everyday_check][:file_path] = upload(file_temp, 'everydaycheck')
        begin
          File.delete('public/uploads/everydaycheck/' + @everyday_check.file_path)
        rescue Exception => e
          puts 'Error happened in everydaycheck'
        else
          #do nothing
        end
      end
      if @everyday_check.update_attributes(params[:everyday_check])
        format.html { redirect_to @everyday_check, notice: 'Everyday check was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @everyday_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /everyday_checks/1
  # DELETE /everyday_checks/1.json
  def destroy
    
    #重写destroy方法.
    @everyday_check = EverydayCheck.find(params[:id])
    begin
       File.delete('public/uploads/everydaycheck/' + @everyday_check.file_path)
    #删除文件有异常
    rescue Exception => e
      @everyday_check.destroy
      respond_to do |format|
        format.html { redirect_to everyday_checks_url }
        format.json { head :no_content }
      end
    #删除文件无异常
    else
      @everyday_check.destroy
      respond_to do |format|
        format.html { redirect_to everyday_checks_url }
        format.json { head :no_content }
      end
    end
    
  end
end
