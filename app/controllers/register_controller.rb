class RegisterController < ApplicationController
  def index
    @user = User.new(params[:user])
    @user.role='1'
    @user.money='10'
    if request.post? and @user.save
      #flash.now[:notice] = "User #{@user.name} created"
      session[:new_user_name]= @user.name
      @user = User.new
      redirect_to :action=>'registred'
    end
  end

  def registred
  end

end
