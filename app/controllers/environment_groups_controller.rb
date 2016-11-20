class EnvironmentGroupsController < ApplicationController
  before_action :set_environment_group, only: [:show, :edit, :update, :destroy]

  # GET /environment_groups
  # GET /environment_groups.json
  def index
    @environment_groups = EnvironmentGroup.all
  end

  # GET /environment_groups/1
  # GET /environment_groups/1.json
  def show
  end

  # GET /environment_groups/new
  def new
    @environment_group = EnvironmentGroup.new
  end

  # GET /environment_groups/1/edit
  def edit
  end

  # POST /environment_groups
  # POST /environment_groups.json
  def create
    @environment_group = EnvironmentGroup.new(environment_group_params)

    respond_to do |format|
      if @environment_group.save
        format.html { redirect_to @environment_group, notice: 'Environment group was successfully created.' }
        format.json { render :show, status: :created, location: @environment_group }
      else
        format.html { render :new }
        format.json { render json: @environment_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /environment_groups/1
  # PATCH/PUT /environment_groups/1.json
  def update
    respond_to do |format|
      if @environment_group.update(environment_group_params)
        format.html { redirect_to @environment_group, notice: 'Environment group was successfully updated.' }
        format.json { render :show, status: :ok, location: @environment_group }
      else
        format.html { render :edit }
        format.json { render json: @environment_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environment_groups/1
  # DELETE /environment_groups/1.json
  def destroy
    @environment_group.destroy
    respond_to do |format|
      format.html { redirect_to environment_groups_url, notice: 'Environment group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environment_group
      @environment_group = EnvironmentGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environment_group_params
      params.require(:environment_group).permit(:name)
    end
end
