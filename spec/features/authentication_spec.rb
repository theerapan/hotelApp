describe 'authentication', js:true do
	let(:customer) do
		Customer.create(email: "test#{rand(100000)}@test.com", password: "password")
	end

	it 'can login' do
		visit '/'
		click_link 'Manager'
		fill_in 'Email', with: customer.email
		fill_in 'Password', with: customer.password
		click_button 'Sign in'

		expect(page).to have_content("Signed in successfully.")
	end
end
