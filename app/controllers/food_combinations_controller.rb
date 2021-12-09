class FoodCombinationsController < ApplicationController
  include Pagy::Backend

  before_action :set_food_combination, only: %i[index overdose]

  def index; end

  def select; end

  def overdose; end

  private

  def set_food_combination
    component = params[:componentId]
    @component_params = params[:component]
    genre_params = params[:genre]
    component_ids = Tag.where(id: @component_params)
    genre_ids = Tag.where(id: genre_params)

    @sugar = Tag.find_by(id: component_ids, component: 'sugar')
    @lipid = Tag.find_by(id: component_ids, component: 'lipid')
    @salt = Tag.find_by(id: component_ids, component: 'salt')
    @noodle = Tag.find_by(id: genre_ids, genre: 'noodle')
    @rice = Tag.find_by(id: genre_ids, genre: 'rice')

    @pagy, @foods = pagy(FoodCombination.preload(:main, :sub).preload(main: { image_attachment: :blob }, sub: { image_attachment: :blob }), items: 25)
  end

end
