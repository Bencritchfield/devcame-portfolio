module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
  	super || 
  end

  def guest_user
  	OpenStruct.new(name: "Guest user",
  								 first_name: "Guest", 
  								 last_name: "User", 
  								 email: "Guest@example.com")
  end
end