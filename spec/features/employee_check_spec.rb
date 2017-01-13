describe "check all employee" do
  let(:customer)do
    Customer.create(email: "test213123@hotmail.com" , password: '123421312321332131213123213')
  end

  let(:employee_fist_1){"first_name#{rand(1000000000)}"}
  let(:employee_last_1){"last_name#{rand(100000000)}"}

  let(:employee_first_2){"first_name#{rand(100000000)}"}
  let(:employee_last_2){"last_name#{rand(10000000000)}"}

  let(:employee_first_3){"first_name#{rand(10000000000)}"}
  let(:employee_last_3){"last_name#{rand(100000000)}"}

  before :each do
    # expect { customer }.to change{ Customer.count }.by 1
    visit 'employees'
    fill_in 'Email' , with: customer.email
    fill_in 'Password' , with: customer.password
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully.')
  end

  it 'can show employee 1' do
    click_link 'New Employee'
    fill_in 'employee[first_name]' , with: employee_fist_1
    fill_in 'employee[last_name]' , with: employee_last_1
    click_button 'Create Employee'

    expect(page).to have_content(employee_fist_1)
    expect(page).to have_content(employee_last_1)
  end

  it 'can show employee 2' do
    click_link 'New Employee'
    fill_in 'employee[first_name]' , with: employee_first_2
    fill_in 'employee[last_name]' , with: employee_last2
    click button 'Create Employee'

    expect(page).to have_content(employee_first_2)
    expect(page).to have_content(employee_last_2)
  end

  it 'can show employee 3' do
    click_link 'New Employee'
    fill_in 'employee[first_name]' , with: employee_first_3
    fill_in 'employee[last_name]' , with: employee_last_3
    click_button 'Create Employee'

    expect(page).to have_content(employee_first_3)
    expect(page).to have_content(employee_last_3)
  end

end
