class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update]
  before_action :set_patient, only: [:new, :show, :update, :create]

  def index
    @appointments = Appointment.filter(params.slice(:search))
          .order(:appointment_date)
          .paginate(:per_page => 5, :page => params[:page])
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

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
      if @appointment.update(appointment_params)
        format.html { redirect_to appointments_url, notice: 'Turno actualizado.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_patient
    @patient = Patient.find(params[:patient_id]) if params[:patient_id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:appointment_date, :patient_id, :doctor_id, :visit_type_id, :place_id)
  end

end
