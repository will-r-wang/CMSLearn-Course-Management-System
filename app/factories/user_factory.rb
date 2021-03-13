# [Design Pattern] Factory Pattern
class UserFactory
  def self.create_user(user_type)
    case user_type
    when 'student'
      Student.new
    when 'teacher'
      Teacher.new
    when 'admin'
      Admin.new
    else
      raise NotImplementedError # raises an exception since User class is abstract
    end
  end
end
