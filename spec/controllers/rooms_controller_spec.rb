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

	# describe '#update' do
	# 	before :each do

	# 		let(:user) do
	# 			User.create!(
	# 			first_name: "first_name",
	# 			last_name: "last_name",
	# 			tel_no: "010101010"
	# 		)
	# 		end
			
	# 		expect { user }.to change{ User.count }.by 1

	# 		sign_in customer
	# 	end

	# 	it 'can update last_name of user from edit room' do
	# 		expect {
	# 			patch :update, {
	# 				first_name: 'first_name',
	# 				last_name: 'updated_last_name',
	# 				tel_no: '010101010'
	# 			}
	# 		}.to
	# 	end
	# end

end











