class UserController < ApplicationController
  def index
    render 'user/new'
  end

  def new
    @user = User.new(user_params)
  end

  def show
    render 'login'
  end

  def create
    @user = User.new(user_params)
    logger.info "value of login in param : #{user_params}" #-> log the actual login
    # logger.info "value of login : #{@user.login}"                    #-> log empty
    if @user.save!
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render 'user/home'
  end

  def user_params
    params.require(:user).permit(:username, :email, :encrypted_password)
  end
  def alert_login_error
    flash[:notice] = "username/password incorect"
    flash[:color]= "invalid"
  end
  def login
    @user = user_params
    @resulted_user = User.find_by_email @user[:email]
    # unless @resulted_user.nil?
    if @resulted_user.nil?
      alert_login_error
      puts '=============================='
      render 'login'
    else
      if (@resulted_user.email.eql? @user[:email]) && (@resulted_user.encrypted_password.eql? @user[:encrypted_password])
        puts @resulted_user.to_s+'------------------'
        session[:user_id] = @resulted_user.id
        render 'home'
      else
        alert_login_error
        render 'login'
      end
    end
  end
end
