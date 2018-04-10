class MotorcyclesController < ApplicationController
  before_action :set_motorcycle, only: [:show, :edit, :update, :destroy]

  # GET /motorcycles
  # GET /motorcycles.json
  def index
    @motorcycles = current_user.motorcycles.all#
  end

  # GET /motorcycles/1
  # GET /motorcycles/1.json
  def show
  end

  # GET /motorcycles/new
  def new
    @motorcycle = current_user.motorcycles.new#criar motos pra o usuário
  end

  # GET /motorcycles/1/edit
  def edit
  end

  # POST /motorcycles
  # POST /motorcycles.json
  def create
    @motorcycle = current_user.motorcycles.new(motorcycle_params)

    respond_to do |format|
      if @motorcycle.save
        format.html { redirect_to @motorcycle, notice: 'Motorcycle was successfully created.' }
        format.json { render :show, status: :created, location: @motorcycle }
      else
        format.html { render :new }
        format.json { render json: @motorcycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motorcycles/1
  # PATCH/PUT /motorcycles/1.json
  def update
    respond_to do |format|
      if @motorcycle.update(motorcycle_params)
        format.html { redirect_to @motorcycle, notice: 'Motorcycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @motorcycle }
      else
        format.html { render :edit }
        format.json { render json: @motorcycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motorcycles/1
  # DELETE /motorcycles/1.json
  def destroy
    @motorcycle.destroy
    respond_to do |format|
      format.html { redirect_to motorcycles_url, notice: 'Motorcycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorcycle
      @motorcycle = current_user.motorcycles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motorcycle_params
      params.require(:motorcycle).permit(:model, :manufacturer, :cylinder, :board).tap do |h|
        h[:user] = current_user#pegar usuário existente
      end
    end
end
