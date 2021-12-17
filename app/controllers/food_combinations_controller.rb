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

    if @component_params == ['1'] && genre_params == ['4']
      @sugar = Tag.where_component(1, 'sugar')
      @noodle = Tag.where_genre(4, 'noodle')
    elsif @component_params == ['1'] && genre_params == ['5']
      @sugar = Tag.where_component(1, 'sugar')
      @rice = Tag.where_genre(5, 'rice')
    elsif @component_params == ['2'] && genre_params == ['4']
      @lipid = Tag.where_component(2, 'lipid')
      @noodle = Tag.where_genre(4, 'noodle')
    elsif @component_params == ['2'] && genre_params == ['5']
      @lipid = Tag.where_component(2, 'lipid')
      @rice = Tag.where_genre(5, 'rice')
    elsif @component_params == ['3'] && genre_params == ['4']
      @salt = Tag.where_component(3, 'salt')
      @noodle = Tag.where_genre(4, 'noodle')
    elsif @component_params == ['3'] && genre_params == ['5']
      @salt = Tag.where_component(3, 'salt')
      @rice = Tag.where_genre(5, 'rice')
    elsif @component_params == %w[1 2] && genre_params == ['4']
      @sugar = Tag.where_component(1, 'sugar')
      @lipid = Tag.where_component(2, 'lipid')
      @noodle = Tag.where_genre(4, 'noodle')
    elsif @component_params == %w[1 2] && genre_params == ['5']
      @sugar = Tag.where_component(1, 'sugar')
      @lipid = Tag.where_component(2, 'lipid')
      @rice = Tag.where_genre(5, 'rice')
    elsif @component_params == %w[1 3] && genre_params == ['4']
      @sugar = Tag.where_component(1, 'sugar')
      @salt = Tag.where_component(3, 'salt')
      @noodle = Tag.where_genre(4, 'noodle')
    elsif @component_params == %w[1 3] && genre_params == ['5']
      @sugar = Tag.where_component(1, 'sugar')
      @salt = Tag.where_component(3, 'salt')
      @rice = Tag.where_genre(5, 'rice')
    elsif @component_params == %w[2 3] && genre_params == ['4']
      @lipid = Tag.where_component(2, 'lipid')
      @salt = Tag.where_component(3, 'salt')
      @noodle = Tag.where_genre(4, 'noodle')
    elsif @component_params == %w[2 3] && genre_params == ['5']
      @lipid = Tag.where_component(2, 'lipid')
      @salt = Tag.where_component(3, 'salt')
      @rice = Tag.where_genre(5, 'rice')
    elsif @component_params == %w[1 2 3] && genre_params == ['4']
      @sugar = Tag.where_component(1, 'sugar')
      @lipid = Tag.where_component(2, 'lipid')
      @salt = Tag.where_component(3, 'salt')
      @noodle = Tag.where_genre(4, 'noodle')
    elsif @component_params == %w[1 2 3] && genre_params == ['5']
      @sugar = Tag.where_component(1, 'sugar')
      @lipid = Tag.where_component(2, 'lipid')
      @salt = Tag.where_component(3, 'salt')
      @rice = Tag.where_genre(5, 'rice')
    end

    @pagy, @foods = pagy(FoodCombination.preload(:main, :sub).preload_food_image, items: 25)
  end
end
