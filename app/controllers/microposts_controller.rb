class MicropostsController < ApplicationController

	def index
	end

	def create
	  @micropost = current_user.microposts.build(params[:micropost])
	  if @micropost.save
		flash[:success] = "Micropost updated"
		redirect_to current_user
	  else
	    render 'static_pages/home'
	  end
	end

	def destroy
	end
end