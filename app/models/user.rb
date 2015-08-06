class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable
         
  
  validates :name, presence: true
  validates :email, presence: true
         

  #New token for User
  def generate_token
    self.code = SecureRandom.urlsafe_base64
  end
end
