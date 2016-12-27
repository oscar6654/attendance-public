class WorkersController < ApplicationController
    def new
        if current_user && current_user.admin? || current_user && current_user.creatememo?
            @worker = User.new
        else
             redirect_to "/welcome/index"
        end
        
    end
    
    def create
        @user = User.new(worker_params)
        if @user.save
            if params[:create_and_add]
                redirect_to "/workers/new", notice: "Added Employee"
            else
                redirect_to "/welcome/index" , notice: "Added Employee"
            end
        end
    end
  def edit
    if current_user && current_user.admin? || current_user && current_user.creatememo?
        @user_edit = User.all
        @user_edit = User.find(params[:id])
    else
        redirect_to "/welcome/index", notice: "No Access Rights"
        
    end
  end

  def update
      @user_edit = User.find(params[:id])
      if @user_edit.update_attributes(edit_params)
        redirect_to "/welcome/index" , notice: "User Profile Updated Succesfully"
      end
  end

    
    private
    def worker_params
        params.require(:user).permit(:name,:email,:gender, :birthday, :starting_date, :sss_id,:tin_id, :phil_health, :pag_ibig_no, :avatar, :position, :role, :division, :region, :is_active, :civil_status,:employment_type, :seller_id)
    end
    
    def edit_params
        params.require(:user).permit(:gender, :birthday, :starting_date, :sss_id,:tin_id, :phil_health, :pag_ibig_no, :avatar, :position, :role, :division, :region, :is_active, :civil_status,:employment_type, :seller_id)
    end
end
