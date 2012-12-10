class SecuritiesController < ApplicationController
  # GET /securities
  # GET /securities.json
  def index
    @securities = Security.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @securities }
    end
  end

  # GET /securities/1
  # GET /securities/1.json
  def show
    require 'helpers/File'
    if params[:id] == 'download'
      download(params[:filename], 'security')
    else
      @security = Security.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @security }
      end
    end
  end

  # GET /securities/new
  # GET /securities/new.json
  def new
    @security = Security.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @security }
    end
  end

  # GET /securities/1/edit
  def edit
    @security = Security.find(params[:id])
  end

  # POST /securities
  # POST /securities.json
  def create
    # 获得客户端userid 和 project_id, securityclassid,
    params[:security][:project_id] = params['project']['projname']
    params[:security][:user_id] = params[:user][:username]
    params[:security][:securityclass_id] = params[:security_class][:securityclassname]
    file_temp = params[:img_file]  
    params[:security][:securitydtl], params[:security][:file_path] = upload(file_temp, 'security')
    @security = Security.new(params[:security])

    respond_to do |format|
      if @security.save
        format.html { redirect_to @security, notice: 'Security was successfully created.' }
        format.json { render json: @security, status: :created, location: @security }
      else
        format.html { render action: "new" }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /securities/1
  # PUT /securities/1.json
  def update
    @security = Security.find(params[:id])

    respond_to do |format|
      
      # 更新服务端数据
      params[:security][:project_id] = params['project']['projname']
      params[:security][:user_id] = params[:user][:username]
      params[:security][:securityclass_id] = params[:security_class][:securityclassname]
      file_temp = params[:img_file]
      if file_temp != nil
        File.delete('public/upload/security/' + @security.file_path)
        params[:security][:securitydtl], params[:security][:file_path] = upload(file_temp, 'security')
      end  
      if @security.update_attributes(params[:security])
        format.html { redirect_to @security, notice: 'Security was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /securities/1
  # DELETE /securities/1.json
  def destroy
    @security = Security.find(params[:id])
    begin
       File.delete('public/uploads/everydaycheck/' + @security.file_path)
    #删除文件有异常
    rescue Exception => e
      @security.destroy
      respond_to do |format|
        format.html { redirect_to securities_url }
        format.json { head :no_content }
      end
    #删除文件无异常
    else
      @security.destroy
      respond_to do |format|
        format.html { redirect_to securities_url }
        format.json { head :no_content }
      end
    end
  end
end
