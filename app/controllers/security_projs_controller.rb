class SecurityProjsController < ApplicationController
  # GET /security_projs
  # GET /security_projs.json
  def index
    @security_projs = SecurityProj.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @security_projs }
    end
  end

  # GET /security_projs/1
  # GET /security_projs/1.json
  def show
    
    require 'helpers/File'
    if params[:id] == 'download'
      download(params[:filename], 'security_proj')
    else
      @security_proj = SecurityProj.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @security_proj }
      end
    end
  end

  # GET /security_projs/new
  # GET /security_projs/new.json
  def new
    @security_proj = SecurityProj.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @security_proj }
    end
  end

  # GET /security_projs/1/edit
  def edit
    @security_proj = SecurityProj.find(params[:id])
  end

  # POST /security_projs
  # POST /security_projs.json
  def create

    # 获得客户端userid 和 project_id,以及security_detail
    params[:security_proj][:project_id] = params[:project][:projname]
    params[:security_proj][:user_id] = params[:user][:username]
    params[:security_proj][:security_proj_type_id] = params[:security_proj_types][:securityprojtypename]
    file_temp = params[:img_file]  
    if file_temp != nil
          params[:security_proj][:detail], params[:security_proj][:file_path] = upload(file_temp, 'security_proj')
    end
    @security_proj = SecurityProj.new(params[:security_proj])
    respond_to do |format|
      if @security_proj.save
        format.html { redirect_to @security_proj, notice: 'Security proj was successfully created.' }
        format.json { render json: @security_proj, status: :created, location: @security_proj }
      else
        format.html { render action: "new" }
        format.json { render json: @security_proj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /security_projs/1
  # PUT /security_projs/1.json
  def update
    @security_proj = SecurityProj.find(params[:id])

    respond_to do |format|
      params[:security_proj][:project_id] = params[:project][:projname]
      params[:security_proj][:user_id] = params[:user][:username]
      params[:security_proj][:security_proj_type_id] = params[:security_proj_types][:securityprojtypename]
      file_temp = params[:img_file]  
      if file_temp != nil
            params[:security_proj][:securitydtl], params[:security_proj][:file_path] = upload(file_temp, 'security_proj')
      end
      if @security_proj.update_attributes(params[:security_proj])
        format.html { redirect_to @security_proj, notice: 'Security proj was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @security_proj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_projs/1
  # DELETE /security_projs/1.json
  def destroy
    @security_proj = SecurityProj.find(params[:id])
    begin
       File.delete('public/uploads/security_proj/' + @security_proj.file_path)
    #删除文件有异常
    rescue Exception => e
      @security_proj.destroy
      respond_to do |format|
        format.html { redirect_to security_projs_url }
        format.json { head :no_content }
      end
    #删除文件无异常
    else
      @security_proj.destroy
      respond_to do |format|
        format.html { redirect_to security_projs_url }
        format.json { head :no_content }
      end
    end
  end
end
