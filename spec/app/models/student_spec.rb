describe Student do
  it "should respond to name" do
    expect(Student.new).to respond_to(:name)
  end

  it "should raise error if name is not set" do
    new_student = Student.new()
    expect(new_student.valid?).to be_falsey
    expect(new_student.errors).to include(:name)
  end
end
