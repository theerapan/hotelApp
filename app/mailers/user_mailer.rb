class UserMailer < ApplicationMailer
	default from: 'Notification <notif@mail.com>'
	def welcome_email(employee)
		@employee = employee
    	mail(to: @employee.first_name, subject: 'Welcome to My Awesome Site')
	end
end
