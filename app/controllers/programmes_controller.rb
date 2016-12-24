class ProgrammesController < ApplicationController
  before_action :set_programme, only: [:show, :edit, :update, :destroy]

  def index
    @programmes = Programme.all
  end

  def show
  end

  def new
    @programme = Programme.new
    6.times { exercise = @programme.exercises.build }
  end

  def edit
    6.times { exercise = @programme.exercises.build } unless @programme.exercises[0]
  end

  def create
    @programme = Programme.new(programme_params)
    @programme.user = current_user
    if @programme.save
      redirect_to @programme, notice: 'Programme and exercises successfully created.'
    else
      render :new
    end
  end

  def update
    if @programme.update(programme_params)
      redirect_to @programme, notice: 'Programme was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @programme.destroy
    redirect_to programmes_url, notice: 'Programme was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programme
      @programme = Programme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programme_params
      params.require(:programme).permit(:name, exercises_attributes:
        [ :id,
          :name,
          :link,
          :notes,
          :reps,
          :tempo,
          :kit
        ])
    end
end
