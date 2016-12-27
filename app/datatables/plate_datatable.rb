class PlateDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegator :@view, :link_to
  def_delegator :@view, :number_to_currency
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['invoices.plate_no','invoices.dispatch_datetime','invoices.account_name','invoices.invoicenum','invoices.invoice_amnt','invoices.delivery_crew']
    #@sortable_columns ||= ['invoices.invoicenum','invoices.sellername','invoices.account_name','invoices.whlocation','invoices.invoice_amnt','invoices.invoice_created_at','invoices.delivery_status','invoices.delivery_date','invoices.post_status']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['invoices.plate_no','invoices.dispatch_datetime','invoices.account_name','invoices.invoicenum','invoices.invoice_amnt','invoices.delivery_crew']
    #@searchable_columns ||= ['invoices.invoicenum','invoices.sellername','invoices.account_name','invoices.whlocation','invoices.invoice_amnt','invoices.invoice_created_at','invoices.delivery_status','invoices.delivery_date','invoices.post_status']
  end

  private

  def data
    records.map do |record|

       [
        record.plate_no,
        #record.dispatch_datetime.strftime('%Y-%m-%d'),
        (record.dispatch_datetime.present? ? record.dispatch_datetime.strftime('%Y-%m-%d') : nil),
        record.account_name,
        record.invoicenum,
        number_to_currency(record.invoice_amnt),
        record.delivery_crew

        
      #   # comma separated list of the values for each cell of a table row
      #   # example: record.attribute,
       ]
  end
  end

  def get_raw_records
    # insert query here
    Invoice.all
    # Invoice.where(:whlocation => "Ilocos")
    Invoice.where.not(plate_no: nil)
    #Invoice.where('plate_no IS NOT NULL')
    

  end
  

  # ==== Insert 'presenter'-like methods below if necessary
end

# class NilClass
#   def strftime(_)
#     ''
#   end
# end


