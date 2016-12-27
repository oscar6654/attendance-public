class CoveragesController < ApplicationController
    around_filter :catch_not_found
    def index
        if current_user && current_user.admin? || current_user && current_user.viewcoverage?
        #@coverage = current_user.coverage.order(:start_time)
            @users = User.all
            @cover = Coverage.all
            #@cover1 = Coverage.all
        # elsif current_user
        #      @cover = current_user.coverages
        #      #@users = User.all
        #      #@users = User.find(current_user[:id])
        else
             redirect_to "/welcome/index"
        end
    end
    
    def curr
        if current_user
            @cover = current_user.coverages
        end
    end
    
    def new
        if current_user 
            @cover1 = Coverage.new(user_id: current_user.id)
            #binding pry
        else
            redirect_to "/welcome/index" , notice: "Please Log In"
        end
    end
    
    def create
        if current_user
            cover = current_user.coverages.today.first
        if cover
            redirect_to "/welcome/index", notice: "Can Only Create Once a Month"
        else
            
            
        #Coverage.create(user_id: current_user.id)
        #@current.update_attributes(weekday_params)
        @cover1 = Coverage.where(user_id: current_user.id).first_or_create.update_attributes(weekday_params)
        
        #@cover1 = current_user.coverages.create({user_id: current_user.id, id: current_user.id}.merge!(weekday_params))
        
        #binding pry
        #@cover1 = Coverage.create(weekday_params)
        #if @current.save!
        #@current.update_attributes(weekday_params)
            redirect_to "/welcome/index" , notice: "Finished Creating Coverage Plan"
    
        
        end
        else
            redirect_to "/welcome/index", notice: "Please Log In"
        end
    end
    
    def show
        if current_user && current_user.admin? || current_user && current_user.viewcoverage?
            @cover1 = User.find(params[:id])
            @c1 = @cover1.coverages

        elsif current_user
            @cover1 = User.find(current_user[:id])
            @c1 = @cover1.coverages
            #@c1 = @cover.coverages
        else
            redirect_to "/welcome/index" , notice: "Please Log In"
        end   
    end
    
    def edit
        if current_user && current_user.admin? || current_user && current_user.updatecoverage?
            #@cover_edit = Coverage.all
            @cover_edit = Coverage.find(params[:user_id])
            #binding pry
            #@cover_edit = current_user.coverages.last
            #@cover_edit = Coverage.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def update
        cover_edit = Coverage.find(params[:id])
        #if @current = Coverage.where(user_id: current_user.id).update_attributes(weekday_params)
        if cover_edit.update_attributes(weekday_params)
            #binding pry
            redirect_to "/coverages", notice: "Finished Updating Coverage Plan"
        else
            redirect_to "/welcome/index", notice: "Update Failed"
        end
    end
    private
    def weekday_params
        params.require(:coverage).permit(:start_time,:monday, :tuesday, :wednesday, :thursday, :friday, :saturday,:monday2,:monday3,:monday4,:tuesday2,:tuesday3,:tuesday4,:wednesday2,:wednesday3,:wednesday4,:thursday2,:thursday3,:thursday4,:friday2,:friday3,:friday4,:saturday2,:saturday3,:saturday4)
    end
    
    def update_weekday
        params.require(:coverage).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday,:monday2,:monday3,:monday4,:tuesday2,:tuesday3,:tuesday4,:wednesday2,:wednesday3,:wednesday4,:thursday2,:thursday3,:thursday4,:friday2,:friday3,:friday4,:saturday2,:saturday3,:saturday4)
    end
    
    def catch_not_found
        yield
    rescue ActiveRecord::RecordNotFound
        redirect_to "/welcome/index", notice: "No Data To Edit"
    end
end
