class PetitionsController < ApplicationController
  before_action :set_petition, only: [:show, :edit, :update, :destroy]

  # GET /petitions
  # GET /petitions.json
  def index
    @petitions = Petition.all
  end

  # GET /petitions/1
  # GET /petitions/1.json
  def show
 
  end 


  # GET /petitions/new
  def new
    @petition = Petition.new
    @petition.user_id = current_user.id
  end

  # GET /petitions/1/edit
  def edit
  end

  # POST /petitions
  # POST /petitions.json
  def create
    @petition = Petition.new(params.require(:petition).permit(:user_id))
    
    respond_to do |format|
      if @petition.save
        format.html { redirect_to root_path, notice: 'Se creo la peticion.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /petitions/1
  # PATCH/PUT /petitions/1.json
  def update
    respond_to do |format|
      if @petition.update(petition_params)
        format.html { redirect_to @petition, notice: 'Petition was successfully updated.' }
        format.json { render :show, status: :ok, location: @petition }
      else
        format.html { render :edit }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions/1
  # DELETE /petitions/1.json
  def destroy
    @petition.destroy
    respond_to do |format|
      format.html { redirect_to petitions_url, notice: 'Petition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def validate
    petition = Petition.find(petition_params[:id])
    user = petition.user
    if params[:commit] == "Aceptar" 
        user.premium  = !user.premium
       user.save
    end
    petition.destroy
    redirect_to root_path, notice: "Se trabajo"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition
      @petition = Petition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_params
      params.require(:petition).permit(:email, :id)
    end


end
