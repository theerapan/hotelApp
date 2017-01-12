describe EmployeesController, as: :controller do
	# rspec-2
	describe '#update' do

		let(:employee) {Employee.create(first_name: "first_name", last_name: "last_name")}

		it "updates last_name" do
			employee_before = employee.last_name
		 	patch :update, id: employee.id, employee: {first_name: "first_name", last_name: "updated_last_name"}
			employee.reload
		 	expect(employee.last_name).not_to equal(employee_before)
		end
	end

end