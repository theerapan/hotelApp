class RoomsController < ApplicationController

	before_action :authenticate_customer!
	
	def index
		@rooms = Room.all
		@employees = Employee.all
		@users = User.all
	end

	def new
		@room = Room.new
		@employees = Employee.all
		@user = User.new
	end

	def create

		first_name = params[:first_name]
		last_name = params[:last_name]
		tel_no = params[:tel_no]

		@user = User.new

		@user.first_name = first_name
		@user.last_name = last_name
		@user.tel_no = tel_no

		@room = Room.new(room_params)

		if @user.save
			puts 'User save success'
			@room.user_id = @user.id
		else
			puts 'User save failed'
		end

		if @room.save
			redirect_to rooms_path
		else
			render 'new'
		end
	end

	def edit
		@room = Room.find(params[:id])
		@employees = Employee.all
		@user = User.find(@room.user_id)
	end

	def update
		first_name = params[:first_name]
		last_name = params[:last_name]
		tel_no = params[:tel_no]

		@room = Room.find(params[:id])

		if User.update(@room.user_id, :first_name => first_name, :last_name => last_name)
			redirect_to rooms_path
		else
			render 'edit'
		end
		
		if @room.update(room_params)
			redirect_to rooms_path
		else
			render 'edit'
		end
	end

	def destroy
		@room = Room.find(params[:id])
		@room.destroy
		redirect_to rooms_path
	end

	private
		def room_params
			params.require(:room).permit(:room_number, :employee_id, :user_id)
		end

end
