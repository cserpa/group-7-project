class FiguresController < ApplicationController

  def index
    @figures = Figure.all.order(average_rating: :desc)
    @figures_recent = Figure.all.order(updated_at: :desc)
  end

  def show
    @figure = Figure.find(params[:id])
    @ratings = Rating.where(figure_id: @figure.id)
  end

  def new
    @figure = Figure.new
  end

  def create
    @figure = Figure.new(figure_params)

    if @figure.save
      flash[:notice] = "Figure added successfully"
      redirect_to figure_path(@figure)
    else
      flash[:notice] = @figure.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def figure_params
    params.require(:figure).permit(:name, :occupation, :era, :nationality, :claim_to_fame)
  end  
end
