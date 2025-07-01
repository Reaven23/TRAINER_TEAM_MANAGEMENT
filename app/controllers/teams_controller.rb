class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy, :players, :coaches, :parents, :add_coach, :create_coach, :remove_coach]

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
    redirect_to teams_url, notice: 'Équipe supprimée avec succès.'
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

  def add_coach
    @users = User.all
  end

  def create_coach
    if params[:user_id].present?
      # Ajouter un utilisateur existant
      user = User.find(params[:user_id])

      unless @team.team_memberships.exists?(user: user, role: 'coach')
        @team.team_memberships.create(user: user, role: 'coach')
        redirect_to @team, notice: "#{user.full_name} a été ajouté comme entraîneur."
      else
        redirect_to @team, alert: "#{user.full_name} est déjà entraîneur de cette équipe."
      end
    elsif params[:new_user].present?
      # Créer un nouvel utilisateur
      new_user_params = params[:new_user]

      # Générer un mot de passe temporaire
      temp_password = "azerty"

      user = User.new(
        first_name: new_user_params[:first_name],
        last_name: new_user_params[:last_name],
        email: new_user_params[:email],
        phone: new_user_params[:phone],
        password: temp_password,
        password_confirmation: temp_password
      )

      if user.save
        @team.team_memberships.create(user: user, role: 'coach')
        redirect_to @team, notice: "#{user.full_name} a été créé et ajouté comme entraîneur. Mot de passe temporaire : #{temp_password}"
      else
        redirect_to add_coach_team_path(@team), alert: "Erreur lors de la création de l'utilisateur : #{user.errors.full_messages.join(', ')}"
      end
    else
      redirect_to add_coach_team_path(@team), alert: "Veuillez sélectionner un utilisateur ou créer un nouvel utilisateur."
    end
  end

  def remove_coach
    user = User.find(params[:user_id])
    membership = @team.team_memberships.find_by(user: user, role: 'coach')

    if membership
      membership.destroy
      redirect_to @team, notice: "#{user.full_name} a été retiré comme entraîneur de l'équipe."
    else
      redirect_to @team, alert: "#{user.full_name} n'est pas entraîneur de cette équipe."
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :category, :description)
  end
end
