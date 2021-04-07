begin
  Admin.create!(first_name: "John", last_name: "Smith", username: "admin", password: "admin", email: "john@smith.com")
rescue ActiveRecord::RecordInvalid
  puts "Validation failed: username \"admin\" has already been taken"
end

begin
  Student.create!(first_name: "Jill", last_name: "Smith", username: "jill", password: "smith", email: "jill@smith.com")
rescue ActiveRecord::RecordInvalid
  puts "Validation failed: username \"jill\" has already been taken"
end

begin
  Teacher.create!(first_name: "Janet", last_name: "Georges", username: "janet", password: "janet", email: "janet@georges.com")
rescue ActiveRecord::RecordInvalid
  puts "Validation failed: username \"janet\" has already been taken"
end

begin
  Semester.create!(name: "Fall 2020", start_date: "Septermber 9 2020".to_date, end_date: "December 11 2020".to_date, registration_deadline: "September 23, 2020".to_date)
  current_semester = Semester.create!(name: "Winter 2021", start_date: "January 11 2021".to_date, end_date: "April 14 2021".to_date, registration_deadline: "January 25, 2020".to_date)
  Semester.create!(name: "Summer 2021", start_date: "May 13 2021".to_date, end_date: "August 16 2021".to_date, registration_deadline: "May 20 2021".to_date)
  Semester.create!(name: "Fall 2021", start_date: "Septermber 8 2021".to_date, end_date: "December 10 2021".to_date, registration_deadline: "September 22, 2021".to_date)
  Semester.create!(name: "Winter 2022", start_date: "January 10 2022".to_date, end_date: "April 12 2022".to_date, registration_deadline: "January 24, 2022".to_date)
rescue ActiveRecord::RecordInvalid
  puts "Validation failed: name has already been taken"
end

begin
  Course.create!(course_name: "Introduction to Computer Science", course_code: "COMP1405", semester: current_semester)
  Course.create!(course_name: "Introduction to Computer Science II", course_code: "COMP1406", semester: current_semester)
  Course.create!(course_name: "Object Oriented Programming", course_code: "COMP3004", semester: current_semester)
rescue ActiveRecord::RecordInvalid
  puts "Validation failed: name has already been taken"
end
