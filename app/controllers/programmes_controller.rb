class ProgrammesController < ApplicationController
  before_action :set_programme, only: [:show, :edit, :update, :destroy]

  def index
    # @programmes = Programme.all
    @programmes = current_user.programmes if current_user
  end

  def new

    @programme = Programme.new
    @user = User.find(params[:user_id])

    6.times { @programme.exercises.build } unless @programme.exercises.length.positive?
  end

  def edit
    @user = User.find(@programme.user_id)
    6.times { @programme.exercises.build } unless @programme.exercises.length.positive?
  end

  def create
    @programme = Programme.create(user_id: params[:user_id])
    @user = User.find(params[:user_id])

    if @programme.save
      redirect_to user_programme_path(@user, @programme), notice: 'Programme and exercises successfully created.'
    else
      render :new
    end
  end

  def update
    if @programme.update(programme_params)
      redirect_to [@programme.user, @programme], notice: 'Programme was successfully updated.'
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
    params.require(:programme).permit(:name, :customer_id,
               exercises_attributes:
                  [:id,
                   :name,
                   :link,
                   :notes,
                   :reps,
                   :tempo,
                   :kit])
  end
end
