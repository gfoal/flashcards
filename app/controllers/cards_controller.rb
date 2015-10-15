class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def create
    card_params = params.require(:card).permit(:original_text, :translated_text)
    card_params[:review_date] = Date.today + 3
    @card = Card.new(card_params)
    if @card.save
      redirect_to(:cards => "index")
    else
      render :action => "new"
    end
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
