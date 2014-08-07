# == Schema Information
#
# Table name: messages
#
#  id                         :integer          not null, primary key
#  topic                      :string(255)
#  body                       :text
#  received_messageable_id    :integer
#  received_messageable_type  :string(255)
#  sent_messageable_id        :integer
#  sent_messageable_type      :string(255)
#  opened                     :boolean          default(FALSE)
#  recipient_delete           :boolean          default(FALSE)
#  sender_delete              :boolean          default(FALSE)
#  created_at                 :datetime
#  updated_at                 :datetime
#  ancestry                   :string(255)
#  recipient_permanent_delete :boolean          default(FALSE)
#  sender_permanent_delete    :boolean          default(FALSE)
#

class Message < ActiveRecord::Base

	 attr_accessor :topic
	 attr_accessor :body
	 belongs_to :sent_user, :foreign_key=>"sent_messageable_id", :class_name=>"User"
	 belongs_to :receive_user, :foreign_key=>"received_messageable_id", :class_name=>"User"
	 
end
