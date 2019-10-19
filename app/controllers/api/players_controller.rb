# frozen_string_literal: true

module API
  class PlayersController < ApplicationController
    before_action :set_player, only: %i[show update destroy]

    # GET /api/players
    def index
      render json: Player.all
    end

    # GET /api/players/1
    def show
      return render_not_found unless @player
      render_ok_json(@player)
    end

    # POST /api/players
    def create
      new_player = Player.create(player_params)
        return render_success(:created)  if new_player.valid?
        render_not_found
    end

    # PATCH/PUT /api/players/1
    def update
      return render_not_found unless @player
      @player.update(player_params)
      return render_not_found unless @player.valid?

      render_ok_json(@player)
    end

    # DELETE /api/players/1
    def destroy

      return render_not_found unless @player
      @player.destroy
      render_ok_json(@player)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player =  Player.find_by(id: params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :age, :position)
    end
  end
end
