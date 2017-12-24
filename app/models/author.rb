class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :rememberable:timeoutable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  has_many :posts
end
