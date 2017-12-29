# == Schema Information
#
# Table name: authors
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :rememberable:timeoutable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  has_many :posts

  validates_presence_of :name, on: :update
  def navbar_title
  	if name.present?
  		name
  	else
  		"Author"
  	end
  end

  def gravatar_image_url
  	"https://www.gravatar.com/avatar/#{gravatar_hash}"	
  end


  private

  def gravatar_hash
  	Digest::MD5.hexdigest(email.downcase)
  end



end
