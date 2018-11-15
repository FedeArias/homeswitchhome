class Auction1sController < ApplicationController
  before_action :set_auction1, only: [:show, :edit, :update, :destroy]

  # GET /auction1s
  # GET /auction1s.json
  def index
    @auction1s = Auction1.all
  end

  # GET /auction1s/1
  # GET /auction1s/1.json
  def show
  end

  # GET /auction1s/new
  def new
    @auction1 = Auction1.new
  end

  # GET /auction1s/1/edit
  def edit
  end

  # POST /auction1s
  # POST /auction1s.json
  def create
    @auction1 = Auction1.new(auction1_params)

    respond_to do |format|
      if @auction1.save
        format.html { redirect_to @auction1, notice: 'Subasta creada correctamente' }
        format.json { render :show, status: :created, location: @auction1 }
      else
        format.html { render :new }
        format.json { render json: @auction1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auction1s/1
  # PATCH/PUT /auction1s/1.json
  def update
    respond_to do |format|
      if @auction1.update(auction1_params)
        format.html { redirect_to @auction1, notice: 'Subasta se acutalizo con exito' }
        format.json { render :show, status: :ok, location: @auction1 }
      else
        format.html { render :edit }
        format.json { render json: @auction1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auction1s/1
  # DELETE /auction1s/1.json
  def destroy
    @auction1.destroy
    respond_to do |format|
      format.html { redirect_to auction1s_url, notice: 'Subasta eliminada correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction1
      @auction1 = Auction1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction1_params
      params.require(:auction1).permit(:nombre, :precio, :puja, :fecha)
    end
end
