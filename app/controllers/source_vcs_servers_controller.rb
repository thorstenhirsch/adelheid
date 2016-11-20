class SourceVcsServersController < ApplicationController
  before_action :set_source_vcs_server, only: [:show, :edit, :update, :destroy]

  # GET /source_vcs_servers
  # GET /source_vcs_servers.json
  def index
    @source_vcs_servers = SourceVcsServer.all
  end

  # GET /source_vcs_servers/1
  # GET /source_vcs_servers/1.json
  def show
  end

  # GET /source_vcs_servers/new
  def new
    @source_vcs_server = SourceVcsServer.new
  end

  # GET /source_vcs_servers/1/edit
  def edit
  end

  # POST /source_vcs_servers
  # POST /source_vcs_servers.json
  def create
    @source_vcs_server = SourceVcsServer.new(source_vcs_server_params)

    respond_to do |format|
      if @source_vcs_server.save
        format.html { redirect_to @source_vcs_server, notice: 'Source vcs server was successfully created.' }
        format.json { render :show, status: :created, location: @source_vcs_server }
      else
        format.html { render :new }
        format.json { render json: @source_vcs_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_vcs_servers/1
  # PATCH/PUT /source_vcs_servers/1.json
  def update
    respond_to do |format|
      if @source_vcs_server.update(source_vcs_server_params)
        format.html { redirect_to @source_vcs_server, notice: 'Source vcs server was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_vcs_server }
      else
        format.html { render :edit }
        format.json { render json: @source_vcs_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_vcs_servers/1
  # DELETE /source_vcs_servers/1.json
  def destroy
    @source_vcs_server.destroy
    respond_to do |format|
      format.html { redirect_to source_vcs_servers_url, notice: 'Source vcs server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_vcs_server
      @source_vcs_server = SourceVcsServer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_vcs_server_params
      params.require(:source_vcs_server).permit(:name, :url, :user, :password, :vcs)
    end
end
