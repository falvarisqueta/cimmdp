class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to doctors_url, notice: 'Doctor Referente creado.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to doctors_url, notice: 'Doctor referente actualizado.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def patients
    @doctor = Doctor.find(params[:id])
    @patients = @doctor.patients
  end

  def destroy
    respond_to do |format|
      if @doctor.destroy
        format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to doctors_url, error: @doctor.errors  }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def doctor_params
    params.require(:doctor).permit(
      :first_name, :last_name, :mail, :phone, :mobile, :address, :specialty, :working_days
    )
  end

end
