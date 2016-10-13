class FiguresController < ApplicationController
  def index
    @user = current_user
    @figures = display_figures
    @ranked_figures = @figures.to_a.sort do |a, b|
      b.average_rating <=> a.average_rating
    end
  end

  def show
    @figure = Figure.find(params[:id])
    @ratings = Rating.where(figure_id: @figure.id)
    @rating = Rating.new
    @ratings_collection = Rating::RATINGS
    @current_user = current_user
    @average_rating = @figure.average_rating
    @vote = Vote.new
  end

  def new
    @figure = Figure.new
    @current_user = current_user
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
    @current_user = current_user
    @figure.user = @current_user

    if @figure.save
      flash[:notice] = "Figure added successfully"
      redirect_to figure_path(@figure)
    else
      flash[:notice] = @figure.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @user = current_user
    @figure = Figure.find(params[:id])
    @figure.destroy
    flash[:notice] = 'History no longer recognizes this figure.'
    if @user.role == 'member'
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  private

  def display_figures
    if params[:search]
      Figure.search(params[:search])
    else
      Figure.all.to_a
    end
  end

  def figure_params
    params.require(:figure).permit(:name, :occupation, :era, :nationality, :claim_to_fame, :user_id)
  end
end
