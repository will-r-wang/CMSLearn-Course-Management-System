class Student < User
  def active_course_registration(course_id)
    CourseRegistration.where(user_id: id, course_id: course_id).first
  end
end
