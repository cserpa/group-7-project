# frozen_string_literal: true
class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @figures = @category.figures
    # @categorizations = Categorization.where(category_id: @category.id)
  end
end
