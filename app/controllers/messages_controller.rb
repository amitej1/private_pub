class MessagesController < ApplicationController
	def index
    @messages = Message.all
  end

  def create
  	user = User.find(params[:message][:receiver_id])
    @user = current_user
    @user1 = user
    @message = Message.create!(params[:message])  
    @channel = "/messages/private/#{user[:id]}/#{current_user[:id]}"
    @channel1 = "/messages/private/#{current_user[:id]}/#{user[:id]}"
    #@channel1 = "/messages/private/#{current_user[:id]}"
    
    #PrivatePub.publish_to("/messages/private/#{user[:id]}", message: @message)
    #PrivatePub.publish_to("/messages/private/#{current_user[:id]}", message: @message)

  end
  def chat
  	 
  	
    user = User.find(params[:id])
    @user = user
    
    @messages = Message.where(("user_id = '#{current_user[:id]}' AND receiver_id = '#{user[:id]}') OR (receiver_id = '#{current_user[:id]}' AND user_id = '#{user[:id]}'"))
    
    #@message = Message.new(:receiver_id=@user.id)
    #@message = Message.create!(params[:message])
    #@channel = "/messages/private/#{user[:id]}"
    
  end

  def onlineuser
    render :layout => false
  end  


end
