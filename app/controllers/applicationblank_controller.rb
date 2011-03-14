class ApplicationblankController < ApplicationController
  protect_from_forgery :except => :post
  
  def index
  end

  def post
    if request.post?
      url = params[:url]
      msg = params[:msg]
      every = params[:every]
      email = params[:email]
      phone = params[:phone]
     
       flash.now[:notice] = url
       
      @message = Message.new
      @message.user_id=1
      @message.url=url
      @message.msg=msg
      @message.every=every
      @message.email=email
      @message.phone=phone
      @message.allowed= false
      @message.save
  #    @message.new
  #   redirect_to("/index.html")
    end
  end

end
