class BillDatatable < AjaxDatatablesRails::ActiveRecord
  include ActionView::Helpers::UrlHelper
  extend Forwardable
  def_delegator  :@view, :link_to, :card_bill_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end
  
  def view_columns
    @view_columns ||= {
      username:       { source: "Bill.username", cond: :like, searchable: true, orderable: true },
      account_no:     { source: "Bill.account_no",  cond: :like, nulls_last: true },
      cvv:            { source: "Bill.cvv" },
      valid_from:     { source: "Bill.valid_from" },
      valid_to:       { source: "Bill.valid_to" },
      amount:         { source: "Bill.amount" }
    }
  end

   def data
     records.map do |record|
       {
       username:     link_to(record.username, "/cards/#{record.card_id.to_s}/bills/#{record.id.to_s}", remote: true),
     account_no:     record.account_no,
            cvv:     record.cvv,
     valid_from:     record.valid_from,
       valid_to:     record.valid_to,
         amount:     record.amount

       }
     end
   end

   def get_raw_records
     @card = Card.find(params[:card_id])
     @bills = Bill.all
   end
 end
