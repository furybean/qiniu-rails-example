class UsersController < ApplicationController
  skip_before_filter :authorize
  
  # GET /users/new  
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /users  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to "/users/login", notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def login
    respond_to do |format|
      format.html # login.html.erb
    end
  end

  def authenticate
    @user = User.authenticate(params[:username], params[:password])
    if (@user)
      session[:user] = @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      redirect_to uploads_path
    else
      flash[:notice] = "failed"
      redirect_to "/users/login"
    end
  end

  def logout
    session[:user] = nil
    session[:user_id] = nil
    redirect_to "/"
  end

end
