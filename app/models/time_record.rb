class TimeRecord < ActiveRecord::Base
    belongs_to :user
    scope :current, -> { where.not(start_time: nil).where(end_time: nil) }
    scope :today, -> { where(:created_at => (Time.now.in_time_zone.beginning_of_day..Time.now.in_time_zone))}
    scope :month, -> {where(:created_at =>(Time.now.in_time_zone.beginning_of_month..Time.now.in_time_zone))}
    # scope :current, -> { where.not(start_time: nil)}
    validate :one_record_per_day, :on => :create
    #validate :one_record_per_day, :on => :update
  private

  def one_record_per_day
    user_time_records = TimeRecord.where(user_id: self.user_id).today
    if user_time_records.count >= 1
      errors.add(:base, "Exceeds daily limit")
      return false
    end
    return true
  end
end