class BillsController < ApplicationController
  def index
     @card = Card.find(params[:card_id])
     @bills = Bill.all
    respond_to do |format|
    format.html
    format.json { render json: BillDatatable.new(params, view_context: view_context) }
  end
 end
  def new
    @bill = Bill.new
  end

  def show
    @card = Card.find(params[:card_id])
    @bill = @card.bills.find(params[:id])
  end

  def create
    @card = Card.find(params[:card_id])
    @bill = @card.bills.new(bill_params)
    if @bill.save
      redirect_to card_bills_path
    else
      redirect_to new_card_bill_path
    end
  end

  def edit
    @card = Card.find(params[:card_id])
    @bill = @card.bills.find(params[:id])
  end


  def update
    @card = Card.find(params[:card_id])
    @bill = @card.bills.find(params[:id])
    if @bill.update(bill_params)
      redirect_to  card_bills_path(@card)
    else
      redirect_to  edit_card_bill_path(@card)
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:username, :account_no, :cvv, :valid_from, :valid_to, :amount)
  end
end
