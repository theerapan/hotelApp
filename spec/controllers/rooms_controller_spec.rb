describe RoomsController, as: :controller do
  let(:customer)do
  customer = Customer.create!(
  email: "user#{rand(100)}@test.com" ,
  password: 'password'
  )
end
let(:employee)do
  employee = Employee.create!(first_name: 'dddd' , last_name:'test')
end
# instant method
describe '#create' do
  before :each do
    # employee = Employee.create!(first_name: 'dddd' , last_name:'test')
    customer = nil
    expect{
      customer = Customer.create!(
      email: "user#{rand(100)}@test.com" ,
      password: 'password'
      )
    }.to change{Customer.count}.by 1

    sign_in customer
  end
  it 'can create' do
    expect{
      post :create, {
        first_name: 'taweesak',
        last_name: 'intarata',
        tel_no: '1234567890',
        room: {
          room_number: 1,
          employee_id: 1,
          user_id: 1
        }
      }
    }.to change{User.count}.by 1
  end

  it 'cant not create without firstname' do
    # employee = Employee.create!(first_name: 'dddd' , last_name:'test')
    customer = nil
    expect{
      customer = Customer.create!(
      email: "user#{rand(100)}@test.com" ,
      password: 'password'
      )
    }.to change{Customer.count}.by 1

    sign_in customer

    expect{
      post :create, {
        last_name: 'intarata',
        tel_no: '1234567890',
        room: {
          room_number: 1,
          employee_id: 1,
          user_id: 1
        }
      }
    }.to change{User.count}.by 0
  end

end
end
