class DatasController < ApplicationController
  def index
      if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.wic? || current_user && current_user.leadstaff? || current_user && current_user.leadosb? || current_user && current_user.viewcoverage?
        #     @users = User.all
        #     @invoice = Invoice.all
        respond_to do |format|
            format.html
            format.json { render json: PlateDatatable.new(view_context) }
        end
        else
             redirect_to "/welcome/index"
        end
  end
  def time_in
    if current_user && current_user.admin? || current_user && current_user.updatememo?
      @users = User.all
      @covers1 = Coverage.all
      #@user_edit = User.all
    else
      redirect_to "/welcome/index", notice: "No Access Rights"
    end
  end
  def invoices
    if current_user && current_user.admin? || current_user && current_user.updatememo? || current_user && current_user.admin_logistic?
    else
      redirect_to "/welcome/index", notice: "No Access Rights"
    end
  end
  def users
    if current_user && current_user.admin? || current_user && current_user.updatememo?
    else
      redirect_to "/welcome/index", notice: "No Access Rights"
    end
  end
end
