class CheckinfsController < ApplicationController
  # GET /checkinfs
  # GET /checkinfs.json
  def index
    @checkinfs = Checkinf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkinfs }
    end
  end

  # GET /checkinfs/1
  # GET /checkinfs/1.json
  def show
    require 'helpers/File'
    if params[:id] == 'download'
      download(params[:filename], 'check')
    else
      @checkinf = Checkinf.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @checkinf }
      end
    end
  end

  # GET /checkinfs/new
  # GET /checkinfs/new.json
  def new
    @checkinf = Checkinf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checkinf }
    end
  end

  # GET /checkinfs/1/edit
  def edit
    @checkinf = Checkinf.find(params[:id])
  end

  # POST /checkinfs
  # POST /checkinfs.json
  def create
    
    # 获得客户端userid 和 project_id, check_class_id, 上传文件
    require 'helpers/File'
    params[:checkinf][:project_id] = params[:project][:projname]
    params[:checkinf][:user_id] = params[:user][:username]
    params[:checkinf][:checkclass_id] = params[:checkclass][:checkclassname]
    file_temp = params[:img_file]  
    params[:checkinf][:checkform], params[:checkinf][:file_path] = upload(file_temp, 'check')
    @checkinf = Checkinf.new(params[:checkinf])

    respond_to do |format|
      if @checkinf.save
        format.html { redirect_to @checkinf, notice: 'Checkinf was successfully created.' }
        format.json { render json: @checkinf, status: :created, location: @checkinf }
      else
        format.html { render action: "new" }
        format.json { render json: @checkinf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checkinfs/1
  # PUT /checkinfs/1.json
  def update
    @checkinf = Checkinf.find(params[:id])

    respond_to do |format|
      
      #获得客户端传递参数
      require 'helpers/File'
      params[:checkinf][:project_id] = params[:project][:projname]
      params[:checkinf][:user_id] = params[:user][:username]
      params[:checkinf][:checkclass_id] = params[:checkclass][:checkclassname]
      file_temp = params[:img_file]  
      params[:checkinf][:checkform], params[:checkinf][:file_path] = upload(file_temp, 'check')
      @checkinf = Checkinf.new(params[:checkinf])
      
      #更新数据库数据操作
      if @checkinf.update_attributes(params[:checkinf])
        format.html { redirect_to @checkinf, notice: 'Checkinf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checkinf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkinfs/1
  # DELETE /checkinfs/1.json
  def destroy
    @checkinf = Checkinf.find(params[:id])
    begin
       File.delete('public/uploads/check/'+@backupinf.file_path)
    
    #删除文件有异常
    rescue Exception => e
      @checkinf.destroy
      respond_to do |format|
        format.html { redirect_to checkinfs_url }
        format.json { head :no_content }
      end
    #删除文件无异常
    else
      @checkinf.destroy
      respond_to do |format|
        format.html { redirect_to checkinfs_url }
        format.json { head :no_content }
      end
    end
  end
end
