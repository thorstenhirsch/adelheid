class SourceVcsRepositoriesController < ApplicationController
  before_action :set_source_vcs_repository, only: [:show, :edit, :update, :destroy]

  # GET /source_vcs_repositories
  # GET /source_vcs_repositories.json
  def index
    @source_vcs_repositories = SourceVcsRepository.all
  end

  # GET /source_vcs_repositories/1
  # GET /source_vcs_repositories/1.json
  def show
  end

  # GET /source_vcs_repositories/new
  def new
    @source_vcs_repository = SourceVcsRepository.new
  end

  # GET /source_vcs_repositories/1/edit
  def edit
  end

  # POST /source_vcs_repositories
  # POST /source_vcs_repositories.json
  def create
    @source_vcs_repository = SourceVcsRepository.new(source_vcs_repository_params)

    respond_to do |format|
      if @source_vcs_repository.save
        format.html { redirect_to @source_vcs_repository, notice: 'Source vcs repository was successfully created.' }
        format.json { render :show, status: :created, location: @source_vcs_repository }
      else
        format.html { render :new }
        format.json { render json: @source_vcs_repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_vcs_repositories/1
  # PATCH/PUT /source_vcs_repositories/1.json
  def update
    respond_to do |format|
      if @source_vcs_repository.update(source_vcs_repository_params)
        format.html { redirect_to @source_vcs_repository, notice: 'Source vcs repository was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_vcs_repository }
      else
        format.html { render :edit }
        format.json { render json: @source_vcs_repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_vcs_repositories/1
  # DELETE /source_vcs_repositories/1.json
  def destroy
    @source_vcs_repository.destroy
    respond_to do |format|
      format.html { redirect_to source_vcs_repositories_url, notice: 'Source vcs repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_vcs_repository
      @source_vcs_repository = SourceVcsRepository.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_vcs_repository_params
      params.require(:source_vcs_repository).permit(:server_id, :name, :shortname)
    end
end
