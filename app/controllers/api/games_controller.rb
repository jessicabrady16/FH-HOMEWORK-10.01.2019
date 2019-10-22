# frozen_string_literal: true
# Game controller methods

class GamesController < ApplicationController
  before_action :set_game, only: %i[show create update destroy]

  # GET /api/games
  def index
    render json: Game.all
  end

  # GET /api/games/:id
  def show
    return render_not_found unless @game

    render_ok_json(@game)
  end

  # POST /api/games/:id
  def create
    new_game = Game.create(game_params)
    return render_success(:created) if new_game.valid?

    render_not_found
  end

  # PUT/PATCH /api/games/:id
  def update
    return render_not_found unless @game

    @game.update(game_params)
    return render_not_found unless @game.valid?

    render_ok_json(@game)
  end

  # DELETE /api/teams/:id
  def destroy
    return render_not_found unless @game

    @game.destroy
    render_ok_json(@game)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find_by(id: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.require(:game).permit(:name, :home_team_id, :away_team_id)
  end
  
end
