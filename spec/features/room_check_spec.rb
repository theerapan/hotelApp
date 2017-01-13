describe 'checkroom' do
  let(:employee) do
    Employee.create(first_name: "first_name" , last_name: "last_name")
  end

  let(:customer) do
		Customer.create(email: "test#{rand(100000)}@test.com",
			password: "password"
		)
	end

  let(:user_first_name){"first_name#{rand(10000)}"}
  let(:user_last_name){"last_name#{rand(100000)}"}
  let(:tel_no){"tel_no#{rand(10000000)}"}

  before :each do
    visit 'rooms'
    fill_in 'Email' , with: customer.email
    fill_in 'Password' , with: customer.password
    click_button 'Sign in'

    expect(page).to have_content("Signed in successfully.")
  end

  it "new reservation" do
    click_link 'New Reservation'
    fill_in 'room[room_number]' , with: rand(1000000)
    find('select#room_employee_id').find(
			"option[value='#{Employee.first.id}']"
			).select_option
    fill_in 'first_name' , with: user_first_name
    fill_in 'last_name' , with: user_last_name
    fill_in 'tel_no' , with: tel_no
    click_button 'Create Room'
    expect(page).to have_content(user_first_name)
  end
end
