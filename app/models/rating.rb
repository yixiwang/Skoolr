class Rating < ActiveRecord::Base
  validates :value, presence: true, inclusion: { :in => [1, 2, 3, 4, 5] }
  belongs_to :school
end
