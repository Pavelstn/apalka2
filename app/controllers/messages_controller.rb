class MessagesController < ApplicationController
  before_filter :authorize, :except => :login

  # GET /messages
  # GET /messages.xml
  #главная страница
  def index
    user_id= session[:user_id]
    @messages = Message.find(:all, :conditions=>"user_id="+user_id.to_s)
    @user= admin_flag(user_id)
    #@money= session[:user_money]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    user_id= session[:user_id]
    message_id= params[:id]
    if Message.is_valid_message(user_id, message_id)
      @message = Message.find(message_id)
      @user= admin_flag(user_id)
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @message }
      end
    else
      @message= nil
      redirect_to :action=>'index'
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    user_id= session[:user_id]
    message_id= params[:id]
    if Message.is_valid_message(user_id, message_id)
      @message = Message.find(message_id)
      @user= admin_flag(user_id)
    else
      @message= nil
      redirect_to :action=>'index'
    end
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    @message.user_id= session[:user_id]
    respond_to do |format|
      if @message.save
        format.html { redirect_to(@message, :notice => 'Message was successfully created.') }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    user_id= session[:user_id]
    message_id= params[:id]
    if Message.is_valid_message(user_id, message_id)
      @message = Message.find(message_id)
      respond_to do |format|
        if @message.update_attributes(params[:message])
          format.html { redirect_to(@message, :notice => 'Message was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
        end
      end
    else
      @message= nil
      redirect_to :action=>'index'
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    user_id= session[:user_id]
    message_id= params[:id]
    if Message.is_valid_message(user_id, message_id)
      @message = Message.find(params[:id])
      @message.destroy
      respond_to do |format|
        format.html { redirect_to(messages_url) }
        format.xml  { head :ok }
      end
    else
      @message= nil
      redirect_to :action=>'index'
    end
  end

  private
  def admin_flag(user_id)
    if User.isadmin(user_id)
      return true
    else
      return false
    end
  end
end
