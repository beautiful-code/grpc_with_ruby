class StudentsController
  class << self
    def search(request)
      students = Student.where("name like '%#{request.name}%'")
      unless students.present?
        raise GRPC::BadStatus.new(
          GRPC::Core::StatusCodes::NOT_FOUND,
          "Couldn't find Student with name: #{request.name}"
        )
      end
      BuildGrpcObjects.convert_students_to_grpc_obj(students)
    end
  end
end
