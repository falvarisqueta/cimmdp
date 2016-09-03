class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update]

  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patients_url, notice: 'Paciente creado.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patients_url, notice: 'Paciente actualizado.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :birth_date, :identifier,
      :address,:phone, :phone_mobile, :contact_phone, :base_medication, :diseases,
      :referring_doctor_id, :qualifying_pathology_id, :protocol_id, :target_protocol_id,
      :patient_number, :contact_name, :contact_relationship, disease_ids:[])
    end
end
