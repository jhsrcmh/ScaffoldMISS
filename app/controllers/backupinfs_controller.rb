class BackupinfsController < ApplicationController
  # GET /backupinfs
  # GET /backupinfs.json
  def index
    @backupinfs = Backupinf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @backupinfs }
    end
  end

  # GET /backupinfs/1
  # GET /backupinfs/1.json
  def show
    require 'helpers/File'
    if params[:id] != 'download'
      @backupinf = Backupinf.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @backupinf }
      end
    else
      download(params[:filename], 'backup')
    end
  end

  # GET /backupinfs/new
  # GET /backupinfs/new.json
  def new
    @backupinf = Backupinf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @backupinf }
    end
  end

  # GET /backupinfs/1/edit
  def edit
    @backupinf = Backupinf.find(params[:id])
  end

  # POST /backupinfs
  # POST /backupinfs.json
  def create
    # 获得客户端userid 和 project_id,并对上传文件进行处理
    require 'helpers/File'
    params[:backupinf][:project_id] = params[:project][:projname]
    params[:backupinf][:user_id] = params[:user][:username]
    params[:backupinf][:backupclass_id] = params[:backup_type][:backuptypename]
    file_temp = params[:img_file]  
    params[:backupinf][:backinf], params[:backupinf][:file_path] = upload(file_temp, 'backup/')
    @backupinf = Backupinf.new(params[:backupinf])
    respond_to do |format|
      if @backupinf.save
        format.html { redirect_to @backupinf, notice: 'Backupinf was successfully created.' }
        format.json { render json: @backupinf, status: :created, location: @backupinf }
      else
        format.html { render action: "new" }
        format.json { render json: @backupinf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /backupinfs/1
  # PUT /backupinfs/1.json
  def update
    @backupinf = Backupinf.find(params[:id])

    respond_to do |format|
      
      #定义更新数据时需进行的操作，通过接受浏览器提交参数，进行解决。
      require 'helpers/File'
      params[:backupinf][:project_id] = params[:project][:projname]
      params[:backupinf][:user_id] = params[:user][:username]
      params[:backupinf][:backupclass_id] = params[:backup_type][:backuptypename]
      file_temp = params[:img_file]  
      params[:backupinf][:backinf], params[:backupinf][:file_path] = upload(file_temp, 'backup/')
      if @backupinf.update_attributes(params[:backupinf])
        format.html { redirect_to @backupinf, notice: 'Backupinf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @backupinf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backupinfs/1
  # DELETE /backupinfs/1.json
  def destroy
    @backupinf = Backupinf.find(params[:id])
    begin
       File.delete('public/uploads/backup/'+@backupinf.file_path)
    
    #删除文件有异常
    rescue Exception => e
      @backupinf.destroy
      respond_to do |format|
        format.html { redirect_to backupinfs_url }
        format.json { head :no_content }
      end
      
    #删除文件无异常
    else
      @backupinf.destroy
      respond_to do |format|
        format.html { redirect_to backupinfs_url }
        format.json { head :no_content }
      end
    end
  end
  
  #下载文件
  def download(file_name, control_type)
    send_file 'public/uploads/' + control_type + '/' + params[:filename] unless params[:filename].blank?
  end
end
