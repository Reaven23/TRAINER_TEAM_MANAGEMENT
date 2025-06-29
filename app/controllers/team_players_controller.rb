class TeamPlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team

  def new
    @users = User.where.not(id: @team.users.pluck(:id))
    @user = User.new
  end

  def create
    if params[:user_id].present?
      # Ajouter un utilisateur existant
      user = User.find(params[:user_id])

      if @team.team_memberships.exists?(user: user)
        redirect_to @team, alert: "#{user.full_name} est déjà dans cette équipe."
      else
        @team.team_memberships.create!(user: user, role: 'player')
        redirect_to @team, notice: "#{user.full_name} a été ajouté à l'équipe."
      end
    else
      # Créer un nouveau joueur
      @user = User.new(user_params)
      @user.password = "azerty" # Mot de passe par défaut
      @user.password_confirmation = "azerty"

      if @user.save
        @team.team_memberships.create!(user: @user, role: 'player')
        redirect_to @team, notice: "#{@user.full_name} a été créé et ajouté à l'équipe."
      else
        @users = User.where.not(id: @team.users.pluck(:id))
        render :new, status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to @team, alert: "Utilisateur non trouvé."
  end

  def destroy
    @player = User.find(params[:id])
    membership = @team.team_memberships.find_by(user: @player, role: 'player')

    if membership
      membership.destroy
      redirect_to @team, notice: "#{@player.full_name} a été retiré de l'équipe."
    else
      redirect_to @team, alert: "Ce joueur n'est pas dans cette équipe."
    end
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :birth_date)
  end
end
