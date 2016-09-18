class SponsorFeesController < ApplicationController
  before_action :set_sponsor_fee, only: [:show, :update]

  # GET /sponsor_fees
  # GET /sponsor_fees.json
  def index
    @sponsor_fees = SponsorFee.all
  end

  # GET /sponsor_fees/1
  # GET /sponsor_fees/1.json
  def show
  end

  # GET /sponsor_fees/new
  def new
    @sponsor_fee = SponsorFee.new
  end

  # GET /sponsor_fees/1/edit
  def edit
  end

  # POST /sponsor_fees
  # POST /sponsor_fees.json
  def create
    @sponsor_fee = SponsorFee.new(sponsor_fee_params)

    respond_to do |format|
      if @sponsor_fee.save
        format.html { redirect_to sponsor_fees_url, notice: 'Sponsor fee was successfully created.' }
        format.json { render :show, status: :created, location: @sponsor_fee }
      else
        format.html { render :new }
        format.json { render json: @sponsor_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsor_fees/1
  # PATCH/PUT /sponsor_fees/1.json
  def update
    respond_to do |format|
      if @sponsor_fee.update(sponsor_fee_params)
        format.html { redirect_to sponsor_fees_url, notice: 'Sponsor fee was successfully updated.' }
        format.json { render :show, status: :ok, location: @sponsor_fee }
      else
        format.html { render :edit }
        format.json { render json: @sponsor_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsor_fees/1
  # DELETE /sponsor_fees/1.json
  def destroy
    @sponsor_fee.destroy
    respond_to do |format|
      format.html { redirect_to sponsor_fees_url, notice: 'Sponsor fee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor_fee
      @sponsor_fee = SponsorFee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_fee_params
      params.require(:sponsor_fee).permit(:visit_type_id, :sponsor_id, :fee_percentage)
    end
end
