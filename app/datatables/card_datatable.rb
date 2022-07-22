class CardDatatable < AjaxDatatablesRails::ActiveRecord
  include ActionView::Helpers::UrlHelper
  extend Forwardable
  def_delegator :@view, :link_to
  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end
  
  def view_columns
    @view_columns ||= {
    username:       { source: "Card.username", cond: :like, searchable: true, orderable: true },
    account_no:     { source: "Card.account_no",  cond: :like, nulls_last: true },
    cvv:            { source: "Card.cvv" },
    valid_from:     { source: "Card.valid_from" },
    valid_to:       { source: "Card.valid_to" },
    status:         { source: "Card.status" }
    }
  end

  def data

    records.map do |record|
      {
      username:     link_to(record.username, record),
    account_no:     record.account_no,
           cvv:     record.cvv,
    valid_from:     record.valid_from,
      valid_to:     record.valid_to,
        status:     record.status
      }
    end
  end

  def get_raw_records
    # @cards = Card.all
    @cards = Card.all
  end
end
