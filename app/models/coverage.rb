class Coverage < ActiveRecord::Base
    belongs_to :user
    scope :today, -> { where(:created_at => (Time.now.in_time_zone.beginning_of_month..Time.now.in_time_zone))}
    validate :one_record_per_day, :on => :create
    private
    def one_record_per_day
    user_time_records = Coverage.where(user_id: self.user_id).today
     if user_time_records.count >= 1
      errors.add(:base, "Exceeds daily limit")
      return false
     end
      return true
    end
end