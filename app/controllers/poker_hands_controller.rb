class PokerHandsController < ApplicationController
  before_action :set_poker_hand, only: %i[ show edit update destroy ]

  # GET /poker_hands or /poker_hands.json
  def index
    @poker_hands = PokerHand.all
  end

  # GET /poker_hands/1 or /poker_hands/1.json
  def show
  end

  # GET /poker_hands/new
  def new
    @poker_hand = PokerHand.new
  end

  # GET /poker_hands/1/edit
  def edit
  end

  # POST /poker_hands or /poker_hands.json
  def create
    @poker_hand = PokerHand.new(poker_hand_params)

    respond_to do |format|
      if @poker_hand.save
        format.html { redirect_to poker_hand_url(@poker_hand), notice: @poker_hand.rank  }
        format.json { render :show, status: :created, location: @poker_hand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poker_hand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poker_hands/1 or /poker_hands/1.json
  def update
    respond_to do |format|
      if @poker_hand.update(poker_hand_params)
        format.html { redirect_to poker_hand_url(@poker_hand), notice: "Poker hand was successfully updated." }
        format.json { render :show, status: :ok, location: @poker_hand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poker_hand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poker_hands/1 or /poker_hands/1.json
  def destroy
    @poker_hand.destroy

    respond_to do |format|
      format.html { redirect_to poker_hands_url, notice: "Poker hand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poker_hand
      @poker_hand = PokerHand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poker_hand_params
      params.require(:poker_hand).permit(:wildcard, cards: [] )
    end
end
