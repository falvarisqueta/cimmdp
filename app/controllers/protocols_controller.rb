class ProtocolsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_protocol, only: [:show, :update]

  def index
    @protocols = Protocol.filter(params.slice(:search))
          .order(sort_column + " " + sort_direction)
          .paginate(:per_page => 5, :page => params[:page])
  end

  # GET /protocols/1
  # GET /protocols/1.json
  def show
    @users = User.all
  end

  # GET /protocols/new
  def new
    @protocol = Protocol.new
    @users = User.all
  end

  # POST /protocols
  # POST /protocols.json
  def create
    @protocol = Protocol.new(protocol_params)

    respond_to do |format|
      if @protocol.save
        format.html { redirect_to protocols_url, notice: 'Protocolo creado.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /protocols/1
  # PATCH/PUT /protocols/1.json
  def update
    respond_to do |format|
      if @protocol.update(protocol_params)
        format.html { redirect_to protocols_url, notice: 'Protocolo actualizado.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_protocol
    @protocol = Protocol.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def protocol_params
    params.require(:protocol).permit(:name, :patients_commitment, :principal_investigator_id, :sub_investigator_id, :coordinator_id)
  end


  def sort_column
    Protocol.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
