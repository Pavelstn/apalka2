class LoginController < ApplicationController


  before_filter :authorize, :except => :login
  
  def index
  end

  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        session[:user_name] = user.name
        #session[:user_money] = user.money
        uri= session[:original_uri]
        session[:original_uri]= nil
        redirect_to(uri ||{:controller=>"messages", :action => "index"})
      else
        flash.now[:notice] = "invalid username or password"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    #    redirect_to(:action => "login")
    redirect_to({:controller=>"login", :action => "login"})
  end




end
