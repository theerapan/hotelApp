class UsersController < ApplicationController

	before_action :authenticate_customer!
	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#redirect_to rooms_path
		else
			#redirect_to rooms_path
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			#redirect_to rooms_path
		else
			#redirect_to rooms_path
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :tel_no)
		end

end
