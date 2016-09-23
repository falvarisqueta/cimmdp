class SponsorChargesController < ApplicationController
  before_action :set_sponsor_charge, only: [:show, :edit, :update, :destroy]

  # GET /sponsor_charges
  # GET /sponsor_charges.json
  def index
    @sponsor_charges = SponsorCharge.all
  end

  # GET /sponsor_charges/1
  # GET /sponsor_charges/1.json
  def show
  end

  # GET /sponsor_charges/new
  def new
    @sponsor_charge = SponsorCharge.new
  end

  # GET /sponsor_charges/1/edit
  def edit
  end

  # POST /sponsor_charges
  # POST /sponsor_charges.json
  def create
    @sponsor_charge = SponsorCharge.new(sponsor_charge_params)

    respond_to do |format|
      if @sponsor_charge.save
        format.html { redirect_to @sponsor_charge, notice: 'Sponsor charge was successfully created.' }
        format.json { render :show, status: :created, location: @sponsor_charge }
      else
        format.html { render :new }
        format.json { render json: @sponsor_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsor_charges/1
  # PATCH/PUT /sponsor_charges/1.json
  def update
    respond_to do |format|
      if @sponsor_charge.update(sponsor_charge_params)
        format.html { redirect_to @sponsor_charge, notice: 'Sponsor charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @sponsor_charge }
      else
        format.html { render :edit }
        format.json { render json: @sponsor_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsor_charges/1
  # DELETE /sponsor_charges/1.json
  def destroy
    respond_to do |format|
      if @sponsor_charge.destroy
        format.html { redirect_to sponsor_charges_url, notice: 'Sponsor charge was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to sponsor_charges_url, error: @sponsor_charge.errors  }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor_charge
      @sponsor_charge = SponsorCharge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_charge_params
      params.fetch(:sponsor_charge, {})
    end
end
