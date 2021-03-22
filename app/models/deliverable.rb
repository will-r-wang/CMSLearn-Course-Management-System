class Deliverable < ApplicationRecord
    belongs_to :activity, polymorphic: true
    has_many: quiz
    has_many: assignment
    has_many: backgroundsurvey
end
