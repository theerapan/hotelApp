class ManagersController < ApplicationController

	before_action :authenticate_customer!
	
	def index
		@managers = Manager.all
	end

	def new
		@manager = Manager.new
	end

	def create
		@manager = Manager.new(manager_params)
		if @manager.save
			redirect_to managers_path
		else
			render 'new'
		end
	end

	def edit
		@manager = Manager.find(params[:id])
	end

	def update
		@manager = Manager.find(params[:id])
		if @manager.update(manager_params)
			redirect_to managers_path
		else
			render 'edit'
		end
	end

	def destroy
	end

	private
		def manager_params
			params.require(:manager).permit(:first_name, :last_name)
		end
end
