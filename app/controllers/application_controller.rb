class ApplicationController < ActionController::Base
  protect_from_forgery
  
    private
  def authorize
    #фильтр проверяет авторизован ли пользователь данне берет из сессии
    #неплохо было бы локализовать
    user= User.find_by_id(session[:user_id])
    
    #unless User.find_by_id(session[:user_id])
    unless user        
      flash[:notice] = "Please log in"
      redirect_to(:controller => "login", :action => "login")
      else
      session[:user_money]= user.money
    end
  end

  def adminauthorize
    #фильтр проверяет адимнистраторские привилегии пользователя данные берет из сесии
    #данные берет из родной модели
    #неплохо было бы локадизовать
    unless User.isadmin(session[:user_id])
      flash[:notice] = "Restricted zone. Please log in Admin"
      redirect_to(:controller => "login", :action => "login")
    end
  end
end
