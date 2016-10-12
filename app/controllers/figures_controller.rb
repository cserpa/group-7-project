# frozen_string_literal: true
class FiguresController < ApplicationController
  def index
    @user = current_user
    @figures = display_figures
    @figures_with_average_rating = {}
    @figures.each do |figure|
      @figures_with_average_rating[figure.id] = figure.average_rating
    end
  end

  def show
    @figure = Figure.find(params[:id])
    @ratings = Rating.where(figure_id: @figure.id)
    @rating = Rating.new
    @ratings_collection = Rating::RATINGS
    @current_user = current_user
    @average_rating = @figure.average_rating
  end

  def new
    @figure = Figure.new
  end

  def edit
    @figure = Figure.find(params[:id])
  end

  def update
    @user = current_user
    figure = Figure.find(params[:id])
    figure.update_attributes(figure_params)
    if @user.role == 'member'
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
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

  def destroy
    @figure = Figure.find(params[:id])
    @figure.destroy
    flash[:notice] = 'History no longer recognizes this figure.'
    redirect_to root_path
  end

  private

  def display_figures
    if params[:search]
      Figure.search(params[:search])
    else
      Figure.all
    end
  end

  def figure_params
    params.require(:figure).permit(:name, :occupation, :era, :nationality, :claim_to_fame)
  end
end
