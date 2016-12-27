class MemosController < ApplicationController
    def index
        if current_user
            @users = User.all
            @memo = Memo.all
        else
            redirect_to "/welcome/index", notice: "Please Log In to see Latest Memo/News"
        end
        
    end
    
    
    def new
        if current_user && current_user.admin? || current_user && current_user.creatememo?
             @memo1 = Memo.new
        else
            redirect_to "/welcome/index" , notice: "Please Log In / No Access Rights"
        end
    end
    
    
    def create
        if current_user && current_user.admin? || current_user && current_user.creatememo?
            @memo1 = Memo.create(memo_params)
            redirect_to "/memos" , notice: "Memo Created"
        else
            redirect_to "/welcome/index" , notice: "Please Log In / No Access Rights"
        end
    end
    def show
        if current_user
            @memo1 = Memo.find(params[:id])
            #@m1 = @memo1.memos
        else
            redirect_to "/welcome/index" , notice: "Please Log In"
        end
    end
    
    def edit
        if current_user && current_user.admin? || current_user && current_user.updatecoverage?
            @memo_edit = Memo.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def update
        memo_edit = Memo.find(params[:id])
        if memo_edit.update_attributes(edit_memo_params)
            redirect_to "/memos", notice: "Finished Updating Memo"
        else
            redirect_to "/welcome/index", notice: "Update Failed"
        end
    end
    
    
   def destroy
        if current_user && current_user.admin? || current_user && current_user.creatememo?
            @memos = Memo.find(params[:id])
            @memos.destroy
            redirect_to "/memos", notice: "Memo deleted."
        else
            redirect_to "/welcome/index"
        end
    end
        
    private
    def memo_params
        params.require(:memo).permit(:topic, :body)
    end
    
    def edit_memo_params
        params.require(:memo).permit(:topic, :body)
    end
    
end
