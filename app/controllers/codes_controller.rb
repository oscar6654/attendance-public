class CodesController < ApplicationController
    def index
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @users = User.all
            @code = Code.all
        else
            redirect_to "/welcome/index"
        end
    end
    
    
    def new
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @code1 = Code.new
        else
            redirect_to "/welcome/index", notice: "Please Log In / No Access Rights"
        end
    end
    
    def create
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @code1 = Code.create(code_params)
            redirect_to "/codes" , notice: "Code Created"
        else
            redirect_to "/welcome/index" , notice: "Please Log In / No Access Rights"
        end
    end
    def show
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @code1 = Code.find(params[:id])
            #@m1 = @memo1.memos
        else
            redirect_to "/welcome/index" , notice: "Please Log In"
        end
    end
    
    def edit
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @code_edit = Code.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    
    def update
        code_edit = Code.find(params[:id])
        if code_edit.update_attributes(edit_code_params)
            redirect_to "/codes", notice: "Finished Updating Code"
        else
            redirect_to "/welcome/index", notice: "Update Failed"
        end
    end
    
    
    def destroy
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @codes = Code.find(params[:id])
            @codes.destroy
            redirect_to "/codes", notice: "Code deleted."
        else
            redirect_to "/welcome/index"
        end
    end
    
    private
    def code_params
        params.require(:code).permit(:name)
    end
    
    def edit_code_params
        params.require(:code).permit(:name)
    end
    

end
