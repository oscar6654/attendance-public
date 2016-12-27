class InvoicesController < ApplicationController
    # around_filter :catch_not_found
    # around_filter :catch_not_found1
    # around_filter :catch_not_found2
    
    def index
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.wic? || current_user && current_user.leadstaff? || current_user && current_user.leadosb? || current_user && current_user.viewcoverage? || current_user && current_user.cashier? || current_user && current_user.ar? || current_user && current_user.accnt_sup?
        #     @users = User.all
        #     @invoice = Invoice.all
        if current_user.pabaza?
            respond_to do |format|
                format.html
                format.json { render json: PabazaDatatable.new(view_context, {current_user: current_user}) }
            end
        elsif current_user.rosario?
            respond_to do |format|
                format.html
                format.json { render json: RosarioDatatable.new(view_context) }
            end
        elsif current_user.pampanga?
            respond_to do |format|
                format.html
                format.json { render json: PampangaDatatable.new(view_context) }
            end
        elsif current_user.ne?
            respond_to do |format|
                format.html
                format.json { render json: NEDatatable.new(view_context) }
            end
        elsif current_user.neta?
            respond_to do |format|
                format.html
                format.json { render json: NetaDatatable.new(view_context) }
            end
        elsif current_user.tarlac?
            respond_to do |format|
                format.html
                format.json { render json: TarlacDatatable.new(view_context) }
            end
        elsif current_user.ilocos?
            respond_to do |format|
                format.html
                format.json { render json: IlocosDatatable.new(view_context) }
            end
        elsif current_user.isabela?
            respond_to do |format|
                format.html
                format.json { render json: IsabelaDatatable.new(view_context) }
            end
        elsif current_user.tuguegarao?
            respond_to do |format|
                format.html
                format.json { render json: TuguegaraoDatatable.new(view_context) }
            end
        elsif current_user.launion?
            respond_to do |format|
                format.html
                format.json { render json: LaUnionDatatable.new(view_context) }
            end
        elsif current_user.bufferloc?
            respond_to do |format|
                format.html
                format.json { render json: BufferLocDatatable.new(view_context) }
            end
        elsif current_user.all?
            respond_to do |format|
                format.html
                format.json { render json: UserDatatable.new(view_context) }
            end
        end
        elsif current_user && current_user.seller?
            respond_to do |format|
                format.html
                format.json { render json: SellerDatatable.new(view_context, {current_user: current_user}) }
            end
        else
             redirect_to "/welcome/index"
        end
    end
    def opened
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.wic? || current_user && current_user.leadstaff? || current_user && current_user.leadosb? || current_user && current_user.viewcoverage?
            @users = User.all
            @invoice = Invoice.all
        else
            redirect_to "/welcome/index"
        end
    end
    
    def new
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.leadosb?
            @invoice1 = Invoice.new
        else
            redirect_to "/welcome/index", notice: "Please Log In / No Access Rights"
        end
    end
    def create
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.leadosb?
            #@seller1 = Seller.create(seller_params)
            @invoice1 = Invoice.create({invoice_created_at: Time.now.in_time_zone}.merge!(invoice_params))
            redirect_to "/invoices" , notice: "Invoice Created"
        else
            redirect_to "/welcome/index" , notice: "Please Log In / No Access Rights"
        end
    end
    
    def import
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.leadosb? || current_user && current_user.itm?
            Invoice.import(params[:file])
            redirect_to "/invoices", notice: "Imported"
        else
            redirect_to "/welcome/index" , notice: "No Access Rights"
        end
    end
    
    def show
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.wic? || current_user && current_user.leadstaff? || current_user && current_user.leadosb? || current_user && current_user.viewcoverage? || current_user && current_user.seller? || current_user && current_user.cashier? || current_user && current_user.ar? || current_user && current_user.accnt_sup?
            @invoice1 = Invoice.find(params[:id])
            #@m1 = @memo1.memos
        else
            redirect_to "/welcome/index" , notice: "Please Log In"
        end
    end
    def edit
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?
            @invoice_edit = Invoice.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def edit_invoice2
        if current_user && current_user.admin? || current_user && current_user.admin_logistic? || current_user && current_user.wic?
            @invoice2_edit = Invoice.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def update_invoice2
        invoice2_edit = Invoice.find(params[:id])
        if  Invoice.find(params[:id]).post_status != 'Closed'
            if invoice2_edit.update_attributes(dispatch_datetime: Time.now.in_time_zone) && invoice2_edit.update_attributes(invoice2_edit_params)
                redirect_to "/invoices", notice: "Finished Updating Invoice"
            else
                redirect_to "/welcome/index", notice: "Update Failed/Invoice is Closed"
            end
        else
            redirect_to "/welcome/index", notice: "Update Failed/Invoice is Closed"
        end
    end
    
    
    
    def edit_invoice3
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?  || current_user && current_user.leadstaff?
            @invoice3_edit = Invoice.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def update_invoice3
        invoice3_edit = Invoice.find(params[:id])
        if Invoice.find(params[:id]).post_status != 'Closed'
            if invoice3_edit.update_attributes(invoice3_edit_params)
                redirect_to "/invoices", notice: "Finished Updating Invoice"
            else
                redirect_to "/welcome/index", notice: "Update Failed/Invoice is Closed"
            end
        else
            redirect_to "/welcome/index", notice: "Update Failed/Invoice is Closed"
        end
        
    end
    
    # //REMITANCE!! START HERE
    def edit_invoice4
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?  || current_user && current_user.seller? || current_user && current_user.accnt_sup? || current_user && current_user.fm?
            @invoice4_edit = Invoice.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def update_invoice4
        invoice4_edit = Invoice.find(params[:id])
        if Invoice.find(params[:id]).post_payment_status != 'Closed'
            if invoice4_edit.update_attributes(remittance_date: Time.now.in_time_zone) && invoice4_edit.update_attributes(invoice4_edit_params)
                redirect_to "/invoices", notice: "Finished Updating Invoice"
            else
                redirect_to "/welcome/index", notice: "Update Failed/Invoice is Closed"
            end
        else
            redirect_to "/welcome/index", notice: "Update Failed/Payment Status is Closed"
        end
    end
    
    def edit_invoice5
        if current_user && current_user.admin? || current_user && current_user.admin_logistic?  || current_user && current_user.seller? || current_user && current_user.accnt_sup? || current_user && current_user.fm?
            @invoice5_edit = Invoice.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def update_invoice5
        invoice5_edit = Invoice.find(params[:id])
        if Invoice.find(params[:id]).post_payment_status_1 != 'Closed'
            if invoice5_edit.update_attributes(remittance_date_1: Time.now.in_time_zone) && invoice5_edit.update_attributes(invoice5_edit_params)
                redirect_to "/invoices", notice: "Finished Updating Invoice"
            else
                redirect_to "/welcome/index", notice: "Update Failed/Invoice is Closed"
            end
        else
            redirect_to "/welcome/index", notice: "Update Failed/Payment Status is Closed"
        end
    end
    def admin_edit_invoice_status_1
        if current_user && current_user.admin? || current_user && current_user.accnt_sup? || current_user && current_user.fm?
            @invoice7_edit = Invoice.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def admin_update_invoice_status_1
        invoice7_edit = Invoice.find(params[:id])
        invoice7_edit.update_attributes(admin_edit_params_1)
        invoice7_edit.save(validate: false)
        redirect_to "/invoices", notice: "Finished Updating Invoice"
        
    end
    #END HERE!!
    def admin_edit_invoice_status
        if current_user && current_user.admin?
            @invoice6_edit = Invoice.find(params[:id])
        else
            redirect_to "/welcome/index", notice: "No Access Rights"
        end
    end
    
    def admin_update_invoice_status
        invoice6_edit = Invoice.find(params[:id])
        invoice6_edit.update_attributes(admin_edit_params)
        invoice6_edit.save(validate: false)
        redirect_to "/invoices", notice: "Finished Updating Invoice"
        
    end
    def update
        invoice_edit = Invoice.find(params[:id])
        if Invoice.find(params[:id]).post_status != 'Closed'
            if invoice_edit.update_attributes(edit_invoice_params)
                redirect_to "/invoices", notice: "Finished Updating Invoice"
            else
                redirect_to "/welcome/index", notice: "Update Failed/Invoice is Closed"
            end
        else
            redirect_to "/welcome/index", notice: "Update Failed/Invoice is Closed"
        end

    end
    
    def destroy
        if current_user && current_user.admin?
            @invoices = Invoice.find(params[:id])
            @invoices.destroy
            redirect_to "/invoices", notice: "Invoice deleted."
        else
            redirect_to "/welcome/index"
        end
    end
    
    private
    def invoice_params
        params.require(:invoice).permit(:whlocation, :segment, :sellername, :sonumber, :account_id, :account_name, :case_qty, :item_qty, :invoice_amnt, :delivery_status, :delivery_date,:invoicenum,:post_status)
    end
    
    def edit_invoice_params
        params.require(:invoice).permit(:whlocation, :segment, :sellername, :sonumber, :account_id, :account_name, :case_qty, :item_qty, :invoice_amnt, :delivery_status, :delivery_date, :invoicenum,:post_status)
    end
    def invoice2_edit_params
        params.require(:invoice).permit(:plate_no, :delivery_crew, :seal_no, :delivery_status).permit!
    end
    
    def invoice3_edit_params
        params.require(:invoice).permit(:rejection_detail, :delivery_status, :remarks, :post_status).permit!
    end
    def invoice4_edit_params
        params.require(:invoice).permit(:bank_name, :invoice_amnt, :payment_mode, :payment_amnt, :check_no, :check_date, :total_deduct, :desc_deduction, :deduction_reference, :decution_amnt,
:desc_deduction1, :deduction_reference1, :decution_amnt1, :desc_deduction2, :deduction_reference2, :decution_amnt2,
:desc_deduction3, :deduction_reference3, :decution_amnt3, :desc_deduction4, :deduction_reference4, :decution_amnt4, 
:desc_deduction5, :deduction_reference5, :decution_amnt5, :desc_deduction6, :deduction_reference6, :decution_amnt6, 
:desc_deduction7, :deduction_reference7, :decution_amnt7, :other_desc_deduction, :other_deduction_reference, :other_decution_amnt,
:other_desc_deduction1, :other_deduction_reference1, :other_decution_amn1t, :other_desc_deduction2, :other_deduction_reference2, :other_decution_amnt2,
:other_desc_deduction3, :other_deduction_reference3, :other_decution_amnt3, :other_desc_deduction4, :other_deduction_reference4, :other_decution_amnt4,
:deduction_sum, :other_deduction_sum, :balance_to_close, :short_over, :deduction_add,:deduction_add1, :deduction_add2, :deduction_add3, :deduction_add4,
:deduction_add5, :deduction_add6, :deduction_add7, :other_deduction_add, :other_deduction_add1, :other_deduction_add2, :other_deduction_add3, :other_deduction_add4, :post_payment_status).permit!
    end
    
    
    def invoice5_edit_params
        params.require(:invoice).permit(:bank_name_1, :invoice_amnt, :payment_mode_1, :payment_amnt_1, :check_no_1, :check_date_1, :total_deduct_1, :desc_deduction_1, :deduction_reference_1, :decution_amnt_1,
:desc_deduction1_1, :deduction_reference1_1, :decution_amnt1_1, :desc_deduction2_1, :deduction_reference2_1, :decution_amnt2_1, :other_desc_deduction_1, :other_deduction_reference_1, :other_decution_amnt_1,
:deduction_sum_1, :other_deduction_sum_1, :balance_to_close_1, :short_over_1, :deduction_add_1,:deduction_add1_1, :deduction_add2_1,:other_deduction_add_1, :post_payment_status_1).permit!
    end
    def admin_edit_params
        params.require(:invoice).permit(:post_status).permit!
    end
    def admin_edit_params_1
        params.require(:invoice).permit(:post_payment_status, :post_payment_status_1).permit!
    end
    def catch_not_found
        yield
    rescue ActiveRecord::RecordNotUnique
        redirect_to "/invoices", notice: "Duplicate Invoice Cant Create"
    end
    def catch_not_found1
        yield
    rescue ActiveRecord::RecordNotFound
        redirect_to "/invoices", notice: "No Record"
    end
    def catch_not_found2
        yield
    rescue ActiveRecord::UnknownAttributeError
        redirect_to "/invoices", notice: "Please Check CSV for correct headers"
    end
    
    
end
