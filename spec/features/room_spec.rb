describe 'room', js:true do

	let(:employee) {Employee.create(first_name: "first_name", last_name: "last_name")}

	let(:customer) do
		Customer.create(email: "test#{rand(100000)}@test.com", password: "password")
	end

	let(:user_first_name) { "fisrt#{rand(1000000)}" }
	let(:user_last_name) { "last#{rand(1000000)}" }

	before :each do
		expect { customer }.to change{ Customer.count }.by 1
		visit 'rooms'
		fill_in 'Email', with: customer.email
		fill_in 'Password', with: customer.password
		click_button 'Sign in'
		expect(page).to have_content("Signed in successfully.")
	end

	it 'can create room' do
		click_link 'New Reservation'
		fill_in 'Room number', with: rand(1000)
		find('select#room_employee_id').find(
			"option[value='#{Employee.first.id}']"
			).select_option
		fill_in 'First name', with: user_first_name
		fill_in 'Last name', with: user_last_name
		fill_in 'Telephone no.', with: rand(1000000000)
		expect { click_button 'Create Room' }.to change(Room, :count).by(1)
		expect(page).to have_content(user_first_name && user_last_name)
	end

end
