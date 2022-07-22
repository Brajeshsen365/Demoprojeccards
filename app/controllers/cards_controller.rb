class CardsController < ApplicationController
  def index
    # @cards = Card.where(status: params[:status])
    respond_to do |format|
      format.html
      format.json { render json: CardDatatable.new(params, view_context: view_context) }
    end
  end

   def new
    @card = Card.new
  end

  def create
  
    @card = current_user.cards.new(card_params)
    if @card.save
      redirect_to cards_path
    else
      redirect_to new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to cards_path
    else
      redirect_to edit
  end
end

private
def card_params
  params.require(:card).permit(:username, :account_no, :cvv, :valid_from, :valid_to, :status)
end
end
