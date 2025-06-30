class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy, :players, :coaches, :parents]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      unless @team.team_memberships.exists?(user: current_user, role: 'coach')
        @team.team_memberships.create(user: current_user, role: 'coach')
      end
      redirect_to @team, notice: 'Équipe créée avec succès. Vous êtes maintenant l\'entraîneur de cette équipe.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'Équipe mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy
    redirect_to root_path, notice: 'Équipe supprimée avec succès.'
  end

  def players
    @players = @team.players
  end

  def coaches
    @coaches = @team.coaches
  end

  def parents
    @parents = @team.parents
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :category, :description)
  end
end
