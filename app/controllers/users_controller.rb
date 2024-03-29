class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    if params[:id] != 'find'
      @user = User.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    else  
      @user = User.find_by_username_and_userpwd(params[:username], digest(params[:userpwd]))
      if @user != nil
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @user }
        end
      else
        @user = User.new
        format.html { render :action => 'findform'}
        format.json { head :no_content}
      end 
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    params[:user][:userpwd] = digest(params[:user][:userpwd])
    @user_temp = User.find_by_username(params[:user][:username])
    @user = User.new(params[:user])
    if @user_temp == nil
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @user_temp, notice: 'User has been created already!'}
        format.json { render json: @user_temp, status: :exist, location: @user_temp}
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  # 重写更新表记录函数，用于更新查询
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      params[:user][:userpwd] = digest(params[:user][:userpwd])
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content}
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url}
      format.json { head :no_content }
    end
  end
  
  #申明MD5加密
  def digest(password_input) 
    require 'digest/md5'   
    return Digest::MD5.hexdigest(password_input)
  end  
  
  #User 登录判定, Json格式数据需注意请求参数设定
  def find
    username = params[:user][:username]
    userpwd = params[:user][:userpwd]
    @user = User.find_by_username_and_userpwd(username, digest(userpwd))
    
    if @user != nil
      respond_to do |format|
        format.html # find.html.erb
        format.json { render json: @user }
      end
    else
      @user = User.new
      respond_to do |format|
        format.html { render action: 'findform'}
        format.json { render json: @user}
      end
    end 
 end
 
  def findform
    @user = User.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end

