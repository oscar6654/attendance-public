class Invoice < ActiveRecord::Base
    belongs_to :user
    #validate :opened_post_status
    #validate :post_status, :if => :opened?
    #validate :opened?, :on=>:edit
    #validate :post_status, where(post_status: 'Opened'),presence: true, :on => :edit
    #attr_accessible :whlocation, :segment, :sellername, :sonumber, :account_id, :account_name, :case_qty, :item_qty, :delivery_status, :delivery_date, :invoice_created_at, :plate_no, :delivery_crew, :dispatch_datetime, :seal_no, :datetime_received, :rejection_detail, :invoicenum, :invoice_amnt, :remarks
    def self.import(file)
        CSV.foreach(file.path, headers: true, encoding:'ISO-8859-1') do |row|
            invoice = find_by_id(row["id"]) || new
            invoice.attributes = row.to_hash
            invoice.save!
        end
    end
    def opened_post_status
        saved_post_status = self.class.find(id).post_status
      if (saved_post_status == 'Closed')
        errors.add(:base, "Already Closed")
        false
      else
        true
      end  
    end
    # def opened?
    #     if (post_status != nil)
    #     # if (post_status == 'Closed')
    #     #     errors.add(:base, "Already Closed")
    #     #     return false

    #     # end
    #     # return true
    # end
    

end