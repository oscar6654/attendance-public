class SheetsController < ApplicationController
def index
    if current_user
        # @working_hours = current_user.working_hours
        # @working = current_user.user_working_hours
        @time_records = current_user.time_records.order(:start_time)
    else
        redirect_to "/welcome/index"
    end
end

def new
    if current_user
        @current_time_record = TimeRecord.new(user_id: current_user.id)
    else
        redirect_to "/welcome/index"
    end
end

def edit
    if current_user
        @current_time_record = current_user.time_records.current.last
    else
        redirect_to "/welcome/index"
    end
end

def update
    time_record = TimeRecord.find(params[:id])
    # time_record = TimeRecord.find(current_user.last[:id])
    if time_record.update_attributes(end_time: Time.now.in_time_zone) && time_record.update_attributes(addgeoout)
        redirect_to "/sheets" , notice: "Please Check If Timed Out Succesfully"
    else
        redirect_to "/welcome/index", notice: "Already Timed Out Today"

    end
end

def create
    #Time.zone = 'Eastern Time (US & Canada)'
    #time_records = TimeRecord.create(user_id: current_user.id, start_time: Time.now.in_time_zone)
    #  time_records = TimeRecord.where(user_id: current_user.id, start_time: Time.now.in_time_zone).first_or_create!
    time_record = current_user.time_records.today.first
    if time_record
      #time_record.update_attributes(addgeo)
      redirect_to "/welcome/index", notice: "Already Timed in Today!"
    else
      current_user.time_records.create({start_time: Time.now.in_time_zone}.merge!(addgeo))
      redirect_to "/sheets" , notice: "Please Check If Timed In Succesfully"
    end
    
end


    private
    def addgeo
        params.require(:time_record).permit(:geolat,:geolng)
    end
    def addgeoout
        params.require(:time_record).permit(:geolatout,:geolngout)
    end
    def work_hour_params
        params.require(:working_hour).permit(:start_time)
    end

end