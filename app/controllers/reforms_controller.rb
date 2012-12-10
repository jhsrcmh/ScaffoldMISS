class ReformsController < ApplicationController
  # GET /reforms
  # GET /reforms.json
  def index
    @reforms = Reform.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reforms }
    end
  end

  # GET /reforms/1
  # GET /reforms/1.json
  def show
    require 'helpers/File'
    if params[:id] == 'download'
      download(params[:filename], 'reform/' + params[:path])
    else
      @reform = Reform.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @everyday_check }
      end
    end
  end

  # GET /reforms/new
  # GET /reforms/new.json
  def new
    @reform = Reform.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reform }
    end
  end

  # GET /reforms/1/edit
  def edit
    @reform = Reform.find(params[:id])
  end

  # POST /reforms
  # POST /reforms.json
  def create
    # 获得客户端userid 和 project_id, 以及reform_id
    require 'helpers/File'
    params[:reform][:project_id] = params[:project][:projname]
    params[:reform][:user_id] = params[:user][:username]
    params[:reform][:reformtype] = params[:reform_type][:name]
    
    #获得两个上传的文件
    file_temp = params[:img_file_reformdoc]
    file_temp_b = params[:img_file_reformresponse]
    params[:reform][:reformdoc], params[:reform][:file_path_a] = upload(file_temp, 'reform/reformdoc')
    params[:reform][:reformresponse], params[:reform][:file_path_b] = upload(file_temp_b, 'reform/reformresponse')
    #必须进行文件是否录入判断，否则，file_path进行各自的维护操作。  
    @reform = Reform.new(params[:reform])

    respond_to do |format|
      if @reform.save
        format.html { redirect_to @reform, notice: 'Reform was successfully created.' }
        format.json { render json: @reform, status: :created, location: @reform }
      else
        format.html { render action: "new" }
        format.json { render json: @reform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reforms/1
  # PUT /reforms/1.json
  def update
    @reform = Reform.find(params[:id])

    respond_to do |format|
      require 'helpers/File'
      params[:reform][:project_id] = params[:project][:projname]
      params[:reform][:user_id] = params[:user][:username]
      params[:reform][:reformtype] = params[:reform_type][:name ]
      
      #每次上传的时候存在一个问题，就是必须判定params[:img_file]是否存在，如果存在，必须得删除原来的file
      file_temp_a = params[:img_file_reformdoc]
      file_temp_b = params[:img_file_refromresponse]
      
      #判定上传文件是否为空，为空，则不进行attribute_update,我们在程序模拟中必须注意到程序本身带来的不好的地方。
      if file_temp_a != nil
        params[:reform][:reformdoc], params[:reform][:file_path_a] = upload(file_temp_a, 'reform/reformdoc')
        begin
          File.delete('public/uploads/reform/reformdoc/' + @reform.file_path_a)
        rescue Exception => e
          puts 'Error happened in reform_reformdoc'
        else
          #do nothing
        end
      end
      if file_temp_b != nil
        params[:reform][:reformresponse], params[:reform][:file_path_b] = upload(file_temp_b, 'reform/reformresponse')
        begin
          File.delete('public/uploads/reform/reformresponse/' + @reform.file_path_b)
        rescue Exception => e
          puts 'Error happened in reform_reformresponse'
        else
          #do nothing
        end
      end
      if @reform.update_attributes(params[:reform])
        format.html { redirect_to @reform, notice: 'Reform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reforms/1
  # DELETE /reforms/1.json
  def destroy
    
    @reform = Reform.find(params[:id])
    begin
       File.delete('public/uploads/reform/reformdoc/' + @reform.file_path_a)
       File.delete('public/uploads/reform/reformresponse/' + @reform.file_path_b)
    #删除文件有异常
    rescue Exception => e
      @reform.destroy
      respond_to do |format|
        format.html { redirect_to reforms_url }
        format.json { head :no_content }
      end
    #删除文件无异常
    else
      @reform.destroy
      respond_to do |format|
        format.html { redirect_to reforms_url }
        format.json { head :no_content }
      end
    end
  end
end
