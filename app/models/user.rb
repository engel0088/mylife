class User
  include MongoMapper::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  key :email, String, :null => false, :default => ""
  key :encrypted_password,  String, :null => false, :default => ""

  ## Recoverable
  key :reset_password_token, String
  key :reset_password_sent_at, Time

  ## Rememberable
  key :remember_created_at, Time

  ## Trackable
  key :sign_in_count, Integer, :default => 0
  key :current_sign_in_at, Time
  key :last_sign_in_at, Time
  key :current_sign_in_ip, String
  key :last_sign_in_ip, String


  key :name

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end

User.ensure_index [[:email, 1]], :unique => true


