module BuildGrpcObjects
  class << self
    def convert_students_to_grpc_obj(students)
      students_grpc_obj = StudentsDetails::Students.new(students: [])
      students.collect do |student|
        students_grpc_obj.students << convert_student_to_grpc_obj(student)
      end
      students_grpc_obj
    end

    def convert_student_to_grpc_obj(student)
      StudentsDetails::Student.new(
        name: student.name,
        age: student.age,
      )
    end
  end
end
