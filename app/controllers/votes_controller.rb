class VotesController < ApplicationController
  def create
    clean_params = vote_params
    rating = Rating.find(clean_params[:rating_id])
    if rating.votes.where(user_id: clean_params[:user_id]).empty?
      Vote.create(clean_params)
    else
      vote = rating.votes.where(user_id: clean_params[:user_id]).first
      if vote.value == clean_params[:value].to_i
        vote.delete
      else
        vote.update_attributes(clean_params)
      end
    end
  end

  def show
    rating = Rating.find(params[:id])

    respond_to do |format|
      format.json { render json: rating.get_total_votes }
    end
  end

  protected

  def vote_params
    params.require(:vote).permit(:user_id, :rating_id, :value)
  end
end
