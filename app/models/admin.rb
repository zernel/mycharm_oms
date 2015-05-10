class Admin < ActiveRecord::Base
	PASSWORD_PLACEHOLDER = "password"
	# Include default devise modules. Others available are:
	# :confirmable, :registerable, :recoverable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :rememberable,
				 :trackable, :validatable, authentication_keys: [:username]

  alias_attribute :to_s, :username
end
