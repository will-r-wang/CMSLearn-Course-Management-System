class Deliverable < Activity
  has_many :submissions, dependent: :delete_all
end
