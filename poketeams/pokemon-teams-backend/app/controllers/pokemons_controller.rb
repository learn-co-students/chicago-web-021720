class PokemonsController < ApplicationController
  def create
    puts '=-================================'
    puts params
    name = Faker::Name.first_name
    species = Faker::Games::Pokemon.name
    pokemon = Pokemon.create(nickname: name, species: species, trainer_id: params[:trainer_id])

    render json: pokemon
  end

  def destroy
    Pokemon.find(params[:id]).destroy

    render json: {message: 'success'}
  end
end
