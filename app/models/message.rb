class Message < ActiveRecord::Base
    attr_accessible :user_id, :content, :receiver_id, :created_at
   
   belongs_to :user
end
