class CloseinfsController < ApplicationController
  # GET /closeinfs
  # GET /closeinfs.json
  def index
    @closeinfs = Closeinf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @closeinfs }
    end
  end

  # GET /closeinfs/1
  # GET /closeinfs/1.json
  def show
    
    require 'helpers/File'
    if params[:id] == 'download'
      download(params[:filename], 'close')
    else
      @closeinf = Closeinf.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @closeinf }
      end
    end
  end
  
  # GET /closeinfs/new
  # GET /closeinfs/new.json
  def new
    @closeinf = Closeinf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @closeinf }
    end
  end

  # GET /closeinfs/1/edit
  def edit
    @closeinf = Closeinf.find(params[:id])
  end

  # POST /closeinfs
  # POST /closeinfs.json
  def create
    # 用于接受客户端参数，并且进行文件上传
    require 'helpers/File'
    params[:closeinf][:user_id] = params[:user][:username]
    params[:closeinf][:project_id] = params[:project][:projname]
    params[:closeinf][:closeinf_type_id] = params[:close_type][:closetypename]
    file_temp = params[:img_file]  
    params[:closeinf][:closedtl], params[:closeinf][:file_path] = upload(file_temp, 'close')
    @closeinf = Closeinf.new(params[:closeinf])

    respond_to do |format|
      if @closeinf.save
        format.html { redirect_to @closeinf, notice: 'Closeinf was successfully created.' }
        format.json { render json: @closeinf, status: :created, location: @closeinf }
      else
        format.html { render action: "new" }
        format.json { render json: @closeinf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /closeinfs/1
  # PUT /closeinfs/1.json
  def update
    @closeinf = Closeinf.find(params[:id])

    respond_to do |format|
      
      # 更新客户端传入的交底参照信息,获得详细的更新信息
      require 'helpers/File'
      params[:closeinf][:user_id] = params[:user][:username]
      params[:closeinf][:project_id] = params[:project][:projname]
      params[:closeinf][:closeinf_type_id] = params[:close_type][:closetypename]
      file_temp = params[:img_file]
        
      #判定上传文件是否为空，为空，则不进行attribute_update,我们在程序模拟中必须注意到程序本身带来的不好的地方。
      if file_temp != nil
        params[:closeinf][:closedtl], params[:closeinf][:file_path] = upload(file_temp, 'close')
        begin
          File.delete('public/uploads/everydaycheck/' + @everyday_check.file_path)
        rescue Exception => e
          puts 'Error happened in everydaycheck'
        else
          #do nothing
        end
      end
      
      if @closeinf.update_attributes(params[:closeinf])
        format.html { redirect_to @closeinf, notice: 'Closeinf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @closeinf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /closeinfs/1
  # DELETE /closeinfs/1.json
  def destroy
    @closeinf = Closeinf.find(params[:id])
   begin
       File.delete('public/uploads/close/'+@closeinf.file_path)
    
    #删除文件有异常
    rescue Exception => e
      @closeinf.destroy
      respond_to do |format|
        format.html { redirect_to closeinfs_url }
        format.json { head :no_content }
      end
    #删除文件无异常
    else
      @checkclose.destroy
      respond_to do |format|
        format.html { redirect_to closeinfs_url }
        format.json { head :no_content }
      end
    end
  end
end
