class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.cimmdp_payments
  end

  def referring_doctor_payments
    @payments = Payment.referring_doctor_payments
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  def pay_selected
    pay_selected_payments(params, payments_url)
  end

  def pay_referring_doctors
    pay_selected_payments(params, referring_doctor_payments_url)
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    respond_to do |format|
      if @payment.destroy
        format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to patients_url, error: @patient.errors  }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def pay_selected_payments(params, redirect_url)
      payments_ids = params[:payments_ids].split(',')
      if payments_ids.any?
        Payment.pay(payments_ids)
        redirect_to redirect_url, notice: 'Payments Payed.'
      else
        redirect_to redirect_url, error: 'No payments were selected.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.fetch(:payment, {})
    end
end
