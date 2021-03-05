class Student < User
    belongs_to :user
    belongs_to :registration
    has_and_belongs_to_many :course
    
end
