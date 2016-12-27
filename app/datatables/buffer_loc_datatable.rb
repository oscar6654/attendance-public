class BufferLocDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegator :@view, :link_to
  def_delegator :@view, :number_to_currency
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['invoices.invoicenum','invoices.sellername','invoices.account_name','invoices.whlocation','invoices.invoice_amnt','invoices.invoice_created_at','invoices.delivery_status','invoices.delivery_date','invoices.post_status']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['invoices.invoicenum','invoices.sellername','invoices.account_name','invoices.whlocation','invoices.invoice_amnt','invoices.invoice_created_at','invoices.delivery_status','invoices.delivery_date','invoices.post_status']
  end

  private

  def data
    records.map do |record|
      [
        link_to(record.invoicenum,record),
        link_to(Seller.find(record.sellername.to_i).name,record),
        link_to(record.account_name, record),
        link_to(record.whlocation,record),
        link_to(number_to_currency(record.invoice_amnt),record),
        link_to(record.invoice_created_at.strftime("%Y-%m-%d"),record),
        link_to(record.delivery_status, record),
        link_to(record.delivery_date, record),
        link_to(record.post_status, record)
        
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
      ]
    end
  end

  def get_raw_records
    # insert query here
    Invoice.all
    Invoice.where(:whlocation => 'Buffer Loc.')
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
