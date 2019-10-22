# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_team, only: %i[show create update destroy]

  # GET /api/teams
  def index
    render json: Team.all
  end

  # GET /api/teams/:id
  def show
    return render_not_found unless @team

    render_ok_json(@team)
  end

  # POST /api/teams/:id
  def create
    new_team = Team.create(team_params)
    return render_success(:created) if new_team.valid?

    render_not_found
  end

  # PUT/PATCH /api/teams/:id
  def update
    return render_not_found unless @team

    @team.update(team_params)
    return render_not_found unless @team.valid?

    render_ok_json(@team)
 end

  # DELETE /api/teams/:id
  def destroy
    return render_not_found unless @team

    @team.destroy
    render_ok_json(@team)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find_by(id: params[:id])
 end

  # Only allow a trusted parameter "white list" through.
  def team_params
    params.require(:team).permit(:name)
  end
end
