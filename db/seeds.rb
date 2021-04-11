require 'faker'

# helper integer function roman to help with roman numeral conversion
class Integer
  ROMAN_NUMBERS = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I",
  }

  def roman
    n = self
    roman = ""
    ROMAN_NUMBERS.each do |value, letter|
      roman << letter * (n / value)
      n = n % value
    end
    return roman
  end
end

puts "Seeding the database..."

ADMIN_COUNT = 3
STUDENT_COUNT = 70
TEACHER_COUNT = 5
SEMESTER_COUNT = 5
COURSE_COUNT = 15
SEMESTER_SEASONS = %w(Fall Winter Summer)
BASE_START_DATE = "September 9 2020".to_date

ADMIN_COUNT.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  Admin.find_or_create_by!(
    first_name: first_name,
    last_name: last_name,
    username: "admin#{i}",
    email: "#{first_name.downcase}.#{last_name.downcase}@cmslearn.com"
  ) do |admin|
    admin.password = "admin#{i}"
  end
end
puts "Admins successfully created."

STUDENT_COUNT.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  Student.find_or_create_by!(
    first_name: first_name,
    last_name: last_name,
    username: "student#{i}",
    email: "#{first_name.downcase}.#{last_name.downcase}@cmslearn.com",
    age: RandomGaussian.new(20, 2).rand.ceil,
    gender: [true, false].sample ? "male" : "female",
  ) do |student|
    student.password = "student#{i}"
  end
end
puts "Students successfully created."

TEACHER_COUNT.times do |i|
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name

  Teacher.find_or_create_by!(
    first_name: first_name,
    last_name: last_name,
    username: "teacher#{i}",
    email: "#{first_name.downcase}.#{last_name.downcase}@cmslearn.com"
  ) do |teacher|
    teacher.password = "teacher#{i}"
  end
end
puts "Teachers successfully created."

SEMESTER_COUNT.times do |i|
  start_date = BASE_START_DATE + (i * 4).months
  Semester.find_or_create_by!(
    name: "#{SEMESTER_SEASONS[(start_date.month / 3.0).ceil % 3]} #{start_date.year}",
    start_date: start_date,
    end_date: start_date + 4.months,
    registration_deadline: start_date + 3.weeks
  )
end
puts "Semesters successfully created."

CURRENT_SEMESTER = Semester.where('start_date < ? AND end_date > ?', Date.today, Date.today).first
COURSE_COUNT.times do |i|
  Course.find_or_create_by!(
    course_name: "Computer Science #{(i+1).roman}",
    course_code: "COMP#{100+i}",
    capacity: 1500,
    semester: CURRENT_SEMESTER,
    teacher: Teacher.limit(1).offset(i % TEACHER_COUNT).first
  )
end
puts "Courses successfully created."

# create 5 pending registrations each for the first 5 courses with an offset of 1 to avoid the first course (see below)
5.times do |i|
  5.times do |j|
    CourseRegistration.find_or_create_by!(
      course: Course.limit(1).offset(i+1).first,
      user: Student.limit(1).offset(j).first,
      status: "pending",
    )
  end
end
puts "Pending course registrations successfully created."

# create approved registrations with grades for better sampling through SDC
STUDENT_COUNT.times do |i|
  CourseRegistration.find_or_create_by!(
    course: Course.first,
    user: Student.limit(1).offset(i).first,
    status: "approved",
    grade: RandomGaussian.new(75, 10).rand.ceil % 100 # in the errant case a value > 100, disallow and set to near 0
  )

  CourseRegistration.find_or_create_by!(
    course: Course.second,
    user: Student.limit(1).offset(i).first,
    status: "approved",
    grade: RandomGaussian.new(75, 10).rand.ceil % 100
  )
end
puts "Approved course registrations successfully created."
