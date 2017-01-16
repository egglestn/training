class ProgrammesController < ApplicationController
  before_action :set_programme, only: [:show, :edit, :update, :destroy]

  def index
    # @programmes = Programme.all
    @programmes = current_user.programmes if current_user
  end

  def new

    @programme = Programme.new

    @programme.customer_id = params[:user]
    @user = User.find(params[:user])
    #@user = User.find(1)

    6.times { @programme.exercises.build }
  end

  def edit
    6.times { @programme.exercises.build } unless @programme.exercises[0]
  end

  def create
    @programme = Programme.new(programme_params)
    puts "-----------------"
    puts @programme.customer_id
    puts @programme.user_id
    puts "-----------------"
    @programme.user_id = @programme.customer_id

    if @programme.save
      redirect_to @programme, notice: 'Programme and exercises successfully created.'
    else
      puts "================="
      puts "Renewing"
      puts @programme.customer_id
      puts programme_params[:customer_id]
      puts "================="

      @user = User.find(1)
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
