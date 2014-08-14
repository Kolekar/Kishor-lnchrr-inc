# == Schema Information
#
# Table name: posts
#
#  id                      :integer          not null, primary key
#  project_name            :string(255)
#  quick_pitch             :text
#  full_pitch              :text
#  user_id                 :integer
#  youtube_id              :string(255)
#  to_the_table            :text
#  compensation_method     :text
#  location                :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  coverimage_file_name    :string(255)
#  coverimage_content_type :string(255)
#  coverimage_file_size    :integer
#  coverimage_updated_at   :datetime
#  logoimage_file_name     :string(255)
#  logoimage_content_type  :string(255)
#  logoimage_file_size     :integer
#  logoimage_updated_at    :datetime
#  url                     :string(255)
#  skills                  :string(255)
#  slug                    :string(255)
#  category                :string(255)
#  latitude                :string(255)
#  longitude               :string(255)
#  is_approved             :boolean          default(FALSE)
#

class Post < ActiveRecord::Base
	extend FriendlyId

  attr_accessible :project_name, :quick_pitch, :coverimage, :logoimage, :full_pitch, :skills,
                  :youtube_id, :to_the_table, :compensation_method, :location, :url, :content,
                  :name, :tag_list,:category,:latitude,:longitude, :is_approved


  friendly_id :project_name, use: :slugged
  acts_as_taggable
  geocoded_by :location
  has_attached_file :coverimage
  has_attached_file :logoimage


  # Google maps code
  after_validation :geocode, :if => :location_changed?

  # relationship
  belongs_to :user

  # validations
  validates_attachment :coverimage, content_type: { content_type: /\Aimage\/.*\Z/ }
  validates_attachment :logoimage, content_type: { content_type: /\Aimage\/.*\Z/ }
  validates :project_name, uniqueness: true



end
