class ArtifactFiltersController < ApplicationController
  before_action :set_artifact_filter, only: [:show, :edit, :update, :destroy]

  # GET /artifact_filters
  # GET /artifact_filters.json
  def index
    @artifact_filters = ArtifactFilter.all
  end

  # GET /artifact_filters/1
  # GET /artifact_filters/1.json
  def show
  end

  # GET /artifact_filters/new
  def new
    @artifact_filter = ArtifactFilter.new
  end

  # GET /artifact_filters/1/edit
  def edit
  end

  # POST /artifact_filters
  # POST /artifact_filters.json
  def create
    @artifact_filter = ArtifactFilter.new(artifact_filter_params)

    respond_to do |format|
      if @artifact_filter.save
        format.html { redirect_to @artifact_filter, notice: 'Artifact filter was successfully created.' }
        format.json { render :show, status: :created, location: @artifact_filter }
      else
        format.html { render :new }
        format.json { render json: @artifact_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artifact_filters/1
  # PATCH/PUT /artifact_filters/1.json
  def update
    respond_to do |format|
      if @artifact_filter.update(artifact_filter_params)
        format.html { redirect_to @artifact_filter, notice: 'Artifact filter was successfully updated.' }
        format.json { render :show, status: :ok, location: @artifact_filter }
      else
        format.html { render :edit }
        format.json { render json: @artifact_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artifact_filters/1
  # DELETE /artifact_filters/1.json
  def destroy
    @artifact_filter.destroy
    respond_to do |format|
      format.html { redirect_to artifact_filters_url, notice: 'Artifact filter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artifact_filter
      @artifact_filter = ArtifactFilter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artifact_filter_params
      params.require(:artifact_filter).permit(:application_id, :key, :value)
    end
end
