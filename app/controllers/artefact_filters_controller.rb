class ArtefactFiltersController < ApplicationController
  before_action :set_artefact_filter, only: [:show, :edit, :update, :destroy]

  # GET /artefact_filters
  # GET /artefact_filters.json
  def index
    @artefact_filters = ArtefactFilter.all
  end

  # GET /artefact_filters/1
  # GET /artefact_filters/1.json
  def show
  end

  # GET /artefact_filters/new
  def new
    @artefact_filter = ArtefactFilter.new
  end

  # GET /artefact_filters/1/edit
  def edit
  end

  # POST /artefact_filters
  # POST /artefact_filters.json
  def create
    @artefact_filter = ArtefactFilter.new(artefact_filter_params)

    respond_to do |format|
      if @artefact_filter.save
        format.html { redirect_to @artefact_filter, notice: 'Artefact filter was successfully created.' }
        format.json { render :show, status: :created, location: @artefact_filter }
      else
        format.html { render :new }
        format.json { render json: @artefact_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artefact_filters/1
  # PATCH/PUT /artefact_filters/1.json
  def update
    respond_to do |format|
      if @artefact_filter.update(artefact_filter_params)
        format.html { redirect_to @artefact_filter, notice: 'Artefact filter was successfully updated.' }
        format.json { render :show, status: :ok, location: @artefact_filter }
      else
        format.html { render :edit }
        format.json { render json: @artefact_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artefact_filters/1
  # DELETE /artefact_filters/1.json
  def destroy
    @artefact_filter.destroy
    respond_to do |format|
      format.html { redirect_to artefact_filters_url, notice: 'Artefact filter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artefact_filter
      @artefact_filter = ArtefactFilter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artefact_filter_params
      params.require(:artefact_filter).permit(:application_id, :key, :value)
    end
end
