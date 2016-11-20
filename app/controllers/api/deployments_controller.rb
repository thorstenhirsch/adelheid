module Api
  class DeploymentsController < BaseController
    before_action :restrict_access
    before_action :set_deployment, only: [:show, :edit, :update, :destroy]

    # GET /deployments
    # GET /deployments.json
    def index
      @deployments = Deployment.all
    end

    # GET /deployments/1
    # GET /deployments/1.json
    def show
    end

    # GET /deployments/new
    def new
      @deployment = Deployment.new
    end

    # GET /deployments/1/edit
    def edit
    end

    # POST /deployments
    # POST /deployments.json
    def create
      @deployment = Deployment.new(deployment_params)

      respond_to do |format|
        if @deployment.save
          format.json { render :show, status: :created, location: @deployment }
        else
          format.json { render json: @deployment.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /deployments/1
    # PATCH/PUT /deployments/1.json
    def update
      respond_to do |format|
        if @deployment.update(deployment_params)
          format.json { render :show, status: :ok, location: @deployment }
        else
          format.json { render json: @deployment.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /deployments/1
    # DELETE /deployments/1.json
    def destroy
      @deployment.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_deployment
        @deployment = Deployment.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def deployment_params
        params.require(:deployment).permit(:timestamp, :notes)
      end
  end
end
