class UserFactory
  def self.create_user(user_type:)
    if user_type == "student"
      Student.new
    elsif user_type == "teacher"
      Teacher.new
    elsif user_type == "admin"
      Admin.new
    else
      raise "user_type not defined"
    end
  end
end
