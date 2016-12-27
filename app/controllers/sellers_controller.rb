class SellersController < ApplicationController
    def index
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @users = User.all
            @seller = Seller.all
        else
            redirect_to "/welcome/index"
        end
    end
    
    
    def new
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @seller1 = Seller.new
        else
            redirect_to "/welcome/index", notice: "Please Log In / No Access Rights"
        end
    end
    
    def create
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @seller1 = Seller.create(seller_params)
            redirect_to "/sellers" , notice: "Seller Created"
        else
            redirect_to "/welcome/index" , notice: "Please Log In / No Access Rights"
        end
    end
    def show
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @seller1 = Seller.find(params[:id])
            #@m1 = @memo1.memos
        else
            redirect_to "/welcome/index" , notice: "Please Log In"
        end
    end
    
    def edit
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @seller_edit = Seller.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    
    def update
        seller_edit = Seller.find(params[:id])
        if seller_edit.update_attributes(edit_seller_params)
            redirect_to "/sellers", notice: "Finished Updating Seller"
        else
            redirect_to "/welcome/index", notice: "Update Failed"
        end
    end
    
    
    def destroy
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @sellers = Seller.find(params[:id])
            @sellers.destroy
            redirect_to "/sellers", notice: "Seller deleted."
        else
            redirect_to "/welcome/index"
        end
    end
    
    private
    def seller_params
        params.require(:seller).permit(:name)
    end
    
    def edit_seller_params
        params.require(:seller).permit(:name)
    end
    

end
