class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:show]
  def index
    if current_user && current_user.admin? || current_user && current_user.updatememo?
      @users = User.all
      @covers1 = Coverage.all
      #@user_edit = User.all
    else
      redirect_to "/welcome/index"
    end
  end
  
  def data
    if current_user
      @users = User.all
      @covers1 = Coverage.all
      #@user_edit = User.all
    else
      redirect_to "/welcome/index"
    end
  end
  def show
    if current_user && current_user.admin? || current_user && current_user.updatememo?
      @user = User.find(params[:id])
      #@cover = User.find(params[:id])
      #@c1 = @cover.coverages
      #@working_hours = current_user.working_hours
      @working_hours  = @user.working_hours
      @working = @user.user_working_hours
      @time_records = @user.time_records.order(:start_time)
    elsif current_user

      @user = User.find(current_user[:id])
      @working_hours  = @user.working_hours
      @working = @user.user_working_hours
      @time_records = @user.time_records.order(:start_time)
      #redirect_to "/welcome/index"


    else
      redirect_to "/welcome/index"

    end
  end
  

  
 def destroy
   if current_user && current_user.admin?
    @user = User.find(params[:id]).destroy
    redirect_to root_url, notice: "User deleted."
  else
    redirect_to "/welcome/index"
   end
  end



    private
    def edit_params
        params.require(:user).permit(:gender, :birthday, :starting_date, :sss_id,:tin_id, :phil_health, :pag_ibig_no, :role, :avatar, :division, :region)
    end

end