describe EmployeesController, as: :controllers do
  describe "Update" do
    let(:employee) {
      Employee.create(first_name: "taweesak" ,
                      last_name: "intaratat")}

    it "can update" do
      patch :update , id: employee , employee: {
                                    first_name: "updated name" ,
                                    last_name:  "updateed name"}
      employee.reload

      expect(employee.first_name) == ("updated name")
      expect(employee.last_name) == ("updateed name")
    end
  end

  describe 'index' do
    it "can shoul be equal" do
      expect {
        @employees = assigns(:employees).length
        @employee  = Employee.all.length
        @employee == @employees
      }
    end
  end

  describe 'destroy' do
    # before :each do
    #   @employee = Employee(:id)
    # end

    # it "delete the user" do
    #   expect {
    #     delete :destroy ,  @employee.id
    #   }.to change(Employee , :count).by(-1)
    # end
    it 'delete the employee' do
      expect {
        Employee.last.destroy
      }.to change(Employee , :count).by(-1)
    end



  end
end
