describe "authentication" do
  let(:customer)do
    Customer.create(email: "test213123@hotmail.com" , password: '123421312321332131213123213')
  end

  it 'can login'do
    visit '/'
    click_link 'Manager'
    fill_in 'Email' , with: customer.email
    fill_in 'Password' , with: customer.password
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully.')
  end
end
