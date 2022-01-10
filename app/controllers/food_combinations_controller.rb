class FoodCombinationsController < ApplicationController
  include Pagy::Backend

  before_action :set_food_combination, only: %i[index overdose]

  def index; end

  def select; end

  def overdose; end

  private

  def set_food_combination
    @component_params = params[:component]
    genre_params = params[:genre]

    @sugar = Tag.find_component(1, 'sugar')
    @lipid = Tag.find_component(2, 'lipid')
    @salt = Tag.find_component(3, 'salt')
    @noodle = Tag.find_genre(4, 'noodle')
    @rice = Tag.find_genre(5, 'rice')

    @pagy, @foods = pagy(FoodCombination.preload(:main, :sub).preload_food_image, items: 25)
  end
end
