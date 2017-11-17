class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def show
    # debugger
    @pokemon = Pokemon.find_by(id: params[:id])
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      # redirect_to api_pokemon_url(@pokemon)
      render :show
    else
      render json: @pokemon.errors.full_messages, status: 422
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(
      :name,
      :poke_type,
      :attack,
      :defense,
      :image_url,
      moves: []
    )
  end
end
