class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :login, :login_index, :create]
  
  def login_index
    set_constants1
    @user = User.new   

    respond_to do |format|
      format.html 
    end    
  end
  
  def login
    user = User.find_by_email(params[:email])
    if(user && user.authenticate(params[:password]))
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:notice] = "Invalid name or password."
      render "login_index"
    end
  end
  
  # GET /users/1
  def show
    set_constants2
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/new
  def new
    set_constants
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    set_constants2
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    set_constants
    @user = User.new(params[:user])
    
    image = params[:user][:image_path] 
    
    if(image!=nil)
      @user.image_path = image.original_filename

      File.open(Rails.root.join('public', 'users', image.original_filename), 'wb') do |file|
        file.write(image.read)
      end
    end
      
    respond_to do |format|
      if @user.save
        Emailer.new_partner(@user, "info@mallorcaror.org").deliver
        Emailer.new_partner(@user, @user.email).deliver
        format.html { redirect_to new_user_url, notice: t('user.ok') }
       else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  def update
    set_constants2
    @user = User.find(params[:id])
    
    @user.image_path = image.original_filename
    
    File.open(Rails.root.join('public', 'users', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  def destroy
    reset_session
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
  
  def destroy_session
    reset_session
    redirect_to root_url
  end
  
  private
  
  def set_constants
    @title = t('user.title') 
    @description = t('user.description')
    @keywords = t('user.keywords')
    @newuser_active = "active" 
  end
  def set_constants1
    @title = t('user.title1') 
    @description = t('user.description')
    @keywords = t('user.keywords')
    @login_active = "active" 
  end
  def set_constants2
    @title = t('user.title2') 
    @description = t('user.description')
    @keywords = t('user.keywords')
    @user_active = "active" 
  end
end
