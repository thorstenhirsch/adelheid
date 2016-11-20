class SourceVcsController < ApplicationController
  before_action :set_source_vc, only: [:show, :edit, :update, :destroy]

  # GET /source_vcs
  # GET /source_vcs.json
  def index
    @source_vcs = SourceVc.all
  end

  # GET /source_vcs/1
  # GET /source_vcs/1.json
  def show
  end

  # GET /source_vcs/new
  def new
    @source_vc = SourceVc.new
  end

  # GET /source_vcs/1/edit
  def edit
  end

  # POST /source_vcs
  # POST /source_vcs.json
  def create
    @source_vc = SourceVc.new(source_vc_params)

    respond_to do |format|
      if @source_vc.save
        format.html { redirect_to @source_vc, notice: 'Source vc was successfully created.' }
        format.json { render :show, status: :created, location: @source_vc }
      else
        format.html { render :new }
        format.json { render json: @source_vc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_vcs/1
  # PATCH/PUT /source_vcs/1.json
  def update
    respond_to do |format|
      if @source_vc.update(source_vc_params)
        format.html { redirect_to @source_vc, notice: 'Source vc was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_vc }
      else
        format.html { render :edit }
        format.json { render json: @source_vc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_vcs/1
  # DELETE /source_vcs/1.json
  def destroy
    @source_vc.destroy
    respond_to do |format|
      format.html { redirect_to source_vcs_url, notice: 'Source vc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_vc
      @source_vc = SourceVc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_vc_params
      params.require(:source_vc).permit(:repository_id, :branch, :tag, :revision)
    end
end
