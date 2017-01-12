describe RoomsController, as: :controllers do

	let(:customer) do
		Customer.create!(
			email: "user#{rand(100000)}@test.com",
			password: "password"
		)
	end

	let(:employee) { Employee.create!(first_name: 'xxx', last_name: 'nnn') }

	describe '#create' do
		before :each do
			expect { customer }.to change{ Customer.count }.by 1

			sign_in customer
		end
		it 'can create' do
			expect {
				post :create, {
					first_name: 'Theerapan', 
					last_name: 'Khanthigul', 
					tel_no: '0909090909',
					room: {
						room_number: 1,
						employee_id: employee.id,
						user_id: customer.id
					}
				}
			}.to change{ User.count }.by 1
		end

		it 'cannot create without first_name of user' do
			expect {
				post :create, {					
					last_name: 'Khanthigul', 
					tel_no: '0909090909',
					room: {
						room_number: 1,
						employee_id: employee.id,
						user_id: customer.id
					}
				}
			}.to change{ User.count }.by 0
		end
	end

	# rspec-1
	describe '#index' do 
		before :each do
			expect { customer }.to change{ Customer.count }.by 1

			sign_in customer
		end

		it 'equal in db' do
			get :index
			expect(assigns(:rooms).length).to eq(Room.all.length)
		end
	end

end











