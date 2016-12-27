class UserWorkingHour < ActiveRecord::Base
    belongs_to :working_hour
    belongs_to :user
end