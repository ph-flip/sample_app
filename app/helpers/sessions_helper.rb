module SessionsHelper
	def sign_in(user)
		session[:current_user_id] = user.id
	end

	def signed_in?
		session[:current_user_id].present?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user?(user)
		user == current_user
	end

	def current_user
		@current_user ||= User.find_by_id(session[:current_user_id])
	end

	def sign_out
		self.current_user = nil
		session[:current_user_id] = nil
	end
end
