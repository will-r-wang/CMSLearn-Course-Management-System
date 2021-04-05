class Teacher < User
  belongs_to :department, optional: true
  has_and_belongs_to_many :course
end
