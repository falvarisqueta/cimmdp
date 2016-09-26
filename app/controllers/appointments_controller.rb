class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def edit
  end

  def new
    @appointment = Appointment.new
  end

  def update_visits
    @patient = Patient.find(params[:id])
    respond_to do |format|
      format.json  { render :json => @patient.visits }
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.appointment_status_id = AppointmentStatus::Pending.id

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointments_url, notice: 'Turno creado.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.complete_appointment(appointment_params)
        format.html { redirect_to appointments_url, notice: 'Turno actualizado.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @appointment.destroy
        format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to appointments_url, error: @appointment.errors  }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:start_time, :patient_id, :doctor_id, :visit_id, :place_id,
    patient_attributes: [:id, :clinical_history])
  end

end
