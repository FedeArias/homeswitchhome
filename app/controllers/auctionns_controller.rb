class AuctionnsController < ApplicationController
  before_action :set_auctionn, only: [:show, :edit, :update, :destroy]

  # GET /auctionns
  # GET /auctionns.json
  def index
    @auctionns = Auctionn.all
  end

  # GET /auctionns/1
  # GET /auctionns/1.json
  def show
  end

  # GET /auctionns/new
  def new
    @auctionn = Auctionn.new
  end

  # GET /auctionns/1/edit
  def edit
  end

  # POST /auctionns
  # POST /auctionns.json
  def create
    @auctionn = Auctionn.new(auctionn_params)

    respond_to do |format|
      if @auctionn.save
        format.html { redirect_to @auctionn, notice: 'La subasta se creo  con exito' }
        format.json { render :show, status: :created, location: @auctionn }
      else
        format.html { render :new }
        format.json { render json: @auctionn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctionns/1
  # PATCH/PUT /auctionns/1.json
  def update
    respond_to do |format|
      if @auctionn.update(auctionn_params)
        format.html { redirect_to @auctionn, notice: 'Auctionn was successfully updated.' }
        format.json { render :show, status: :ok, location: @auctionn }
      else
        format.html { render :edit }
        format.json { render json: @auctionn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctionns/1
  # DELETE /auctionns/1.json
  def destroy
    @auctionn.destroy
    respond_to do |format|
      format.html { redirect_to auctionns_url, notice: 'Auctionn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auctionn
      @auctionn = Auctionn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auctionn_params
      params.require(:auctionn).permit(:puja,  :fecha, :participantes, :precio, :minimo)
    end
end
