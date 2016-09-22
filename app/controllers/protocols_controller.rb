class ProtocolsController < ApplicationController
  before_action :set_protocol, only: [:show, :update]

  def index
    @protocols = Protocol.all
  end

  # GET /protocols/1
  # GET /protocols/1.json
  def show

  end

  # GET /protocols/new
  def new
    @protocol = Protocol.new
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
    params.require(:protocol).permit(:code, :name, :sponsor_id, :patients_commitment,
      :principal_investigator_id, :coordinator_id, :backup_coordinator_id,
      :monitor_name, :monitor_phone, :monitor_mobile, :monitor_email,
      :monitor_name1, :monitor_phone1, :monitor_mobile1, :monitor_email1,
      :monitor_name2, :monitor_phone2, :monitor_mobile2, :monitor_email2,
      :referring_doctor_payment_price, sub_investigator_ids:[])
  end
end
