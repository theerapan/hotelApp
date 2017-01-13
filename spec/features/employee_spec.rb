describe 'employee', js:true do

	let(:customer) do
		Customer.create(email: "test#{rand(100000)}@test.com", password: "password")
	end

	let(:emp_f_1) { "fisrt#{rand(100000)}" }
	let(:emp_l_1) { "last#{rand(100000)}" }

	let(:emp_f_2) { "fisrt#{rand(100000)}" }
	let(:emp_l_2) { "last#{rand(100000)}" }

	let(:emp_f_3) { "fisrt#{rand(100000)}" }
	let(:emp_l_3) { "last#{rand(100000)}" }

	before :each do
		expect { customer }.to change{ Customer.count }.by 1

		visit 'employees'
		fill_in 'Email', with: customer.email
		fill_in 'Password', with: customer.password
		click_button 'Sign in'

		expect(page).to have_content("Signed in successfully.")
	end

	it 'can show valid employee 1' do
		click_link 'New Employee'
		fill_in 'First name', with: emp_f_1
		fill_in 'Last name', with: emp_l_1
		click_button 'Create Employee'
		# uncomment if want to save screen shot
		# save_screenshot('/Users/Jedi/Desktop/emp1.jpg')
		expect(page).to have_content(emp_f_1)
	end

	it 'can show valid employee 2' do
		click_link 'New Employee'
		fill_in 'First name', with: emp_f_2
		fill_in 'Last name', with: emp_l_2
		click_button 'Create Employee'
		# uncomment if want to save screen shot
		# save_screenshot('/Users/Jedi/Desktop/emp2.jpg')
		expect(page).to have_content(emp_f_1 && emp_f_2)
	end

	it 'can show valid employee 1' do
		click_link 'New Employee'
		fill_in 'First name', with: emp_f_3
		fill_in 'Last name', with: emp_l_3
		click_button 'Create Employee'
		# uncomment if want to save screen shot
		# save_screenshot('/Users/Jedi/Desktop/emp3.jpg')
		expect(page).to have_content(emp_f_1 && emp_f_2 && emp_f_3)
	end
end
