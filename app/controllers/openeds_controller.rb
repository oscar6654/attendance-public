class OpenedsController < ApplicationController
    def index
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.wic? || current_user && current_user.leadstaff? || current_user && current_user.leadosb? || current_user && current_user.viewcoverage?
            #@users = User.all
            @invoices = Invoice.all
        else
            redirect_to "/welcome/index"
        end
    end
    
    def show
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.wic? || current_user && current_user.leadstaff? || current_user && current_user.leadosb? || current_user && current_user.viewcoverage?
            @invoice1 = Invoice.find(params[:id])
            #@m1 = @memo1.memos
        else
            redirect_to "/welcome/index" , notice: "Please Log In"
        end
    end
    
    def edit_multiple
        @invoices = Invoice.find(params[:invoice_ids])
    end
    def update_multiple
        @invoices = Invoice.find(params[:invoice_ids])
        @invoices.reject! do |product|
          #product.update_attributes(params[:product].reject { |k,v| v.blank? })
          product.update_attributes(invoice3_edit_params) && product.update_attributes(dispatch_datetime: Time.now.in_time_zone) 
          #product.save(validate: false)
          end
        #end
        if @invoices.empty?
          redirect_to "/openeds", notice: "Delivery Fulfillment Updated!"
        else
          @product = Invoice.new(params[:product])
          render "edit_multiple"
        end
    end
    private
    def invoice3_edit_params
        params.require(:invoice).permit(:plate_no,:delivery_crew,:seal_no,:delivery_status).permit!
    end
end
