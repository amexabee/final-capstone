class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :swim_class
end
