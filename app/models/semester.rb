class Semester < ApplicationRecord
    has_and_belongs_to_many :course
end
