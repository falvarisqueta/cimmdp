class DiseasesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_disease, only: [:show, :update]

  def index
    @diseases = Disease.filter(params.slice(:search))
          .order(sort_column + " " + sort_direction)
          .paginate(:per_page => 5, :page => params[:page])
  end

  def show
  end

  def new
    @disease = Disease.new
  end

  def create
    @disease = Disease.new(disease_params)

    respond_to do |format|
      if @disease.save
        format.html { redirect_to diseases_url, notice: 'Enfermedad creada.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disease.update(disease_params)
        format.html { redirect_to diseases_url, notice: 'Enfermedad actualizado.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_disease
    @disease = Disease.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def disease_params
    params.require(:disease).permit(:name, :code)
  end

  def sort_column
    Disease.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
