class ArrivalsController < ApplicationController
  before_action :set_arrival, only: %i[ show edit update destroy ]

  # GET /arrivals or /arrivals.json
  def index
    @arrivals = Arrival.all
  end

  # GET /arrivals/1 or /arrivals/1.json
  def show
  end

  # GET /arrivals/new
  def new
    @arrival = Arrival.new
  end

  # GET /arrivals/1/edit
  def edit
  end

  # POST /arrivals or /arrivals.json
  def create
    @arrival = Arrival.new(arrival_params)

    respond_to do |format|
      if @arrival.save
        format.html { redirect_to arrival_url(@arrival), notice: "Arrival was successfully created." }
        format.json { render :show, status: :created, location: @arrival }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arrivals/1 or /arrivals/1.json
  def update
    respond_to do |format|
      if @arrival.update(arrival_params)
        format.html { redirect_to arrival_url(@arrival), notice: "Arrival was successfully updated." }
        format.json { render :show, status: :ok, location: @arrival }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arrivals/1 or /arrivals/1.json
  def destroy
    @arrival.destroy

    respond_to do |format|
      format.html { redirect_to arrivals_url, notice: "Arrival was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrival
      @arrival = Arrival.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def arrival_params
      params.require(:arrival).permit(:name)
    end
end
