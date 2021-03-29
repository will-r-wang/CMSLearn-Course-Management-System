class User < ApplicationRecord
  belongs_to :registration, optional: true
end
