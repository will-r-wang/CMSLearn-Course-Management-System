class Teacher < User
    belongs_to: department
    has_and_belongs_to_many: course
end
