class WorkingHour < ActiveRecord::Base
  has_many :user_working_hours
  has_many :users, through: :user_working_hours
end