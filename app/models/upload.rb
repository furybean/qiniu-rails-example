class Upload < ActiveRecord::Base
  attr_accessible :file_key, :file_name, :file_size, :file_type, :user_id
  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
end
