class Course < ApplicationRecord
    has_many :student
    has_many :activity

end
