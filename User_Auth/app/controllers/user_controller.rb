class UserController < ApplicationController
  def index
    render 'user/new'
  end
  def new
    @user = User.new(user_params)
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
    render "new"
  end
  def user_params
    params.require(:user).permit(:username, :encrypted_password)
  end

end
