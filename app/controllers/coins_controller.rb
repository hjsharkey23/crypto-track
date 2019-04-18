class CoinsController < OpenReadController
  before_action :set_coin, only: [:update, :destroy]

  # GET /coins
  def index
    @usercoins = current_user.coins.all
    render json: @usercoins
  end

  # GET /coins/1
  def show
    render json: Coin.find(params[:id])
  end

  # POST /coins
  def create
    @coin = current_user.coins.create(coin_params)

    if @coin.save
      render json: @coin, status: :created, location: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coins/1
  def update
    if @coin.update(coin_params)
      render json: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coins/1
  def destroy
    @coin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = current_user.coins.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coin_params
      params.require(:coin).permit(:name, :quantity, :user_id)
    end
end
