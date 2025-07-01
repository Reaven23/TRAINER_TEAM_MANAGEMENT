class UserSkillsController < ApplicationController
  before_action :set_user, only: [:index, :create, :update, :pdf]
  before_action :set_user_skill, only: [:update, :destroy]

  def index
    @skills = Skill.all
  end

  def pdf
    @skills = Skill.all
    @latest_assessment = @user.player_assessments.latest_for_user(@user)
    respond_to do |format|
      format.pdf do
        render pdf: "competences_#{@user.full_name.parameterize}",
               template: "user_skills/pdf",
               layout: false,
               page_size: 'A4',
               margin: {
                 top: 20,
                 bottom: 20,
                 left: 20,
                 right: 20
               },
               orientation: 'Portrait',
               title: "Compétences de #{@user.full_name}"
      end
    end
  end

  def show
  end

  def new
  end

  def create
    @user_skill = @user.user_skills.build(user_skill_params)

    # S'assurer qu'un statut est défini
    @user_skill.status ||= 'Non_Acquis'

    if @user_skill.save
      respond_to do |format|
        format.html { redirect_to user_skills_path(@user), notice: 'Compétence ajoutée avec succès.' }
        format.json { render json: { status: 'success', message: 'Compétence ajoutée' } }
      end
    else
      respond_to do |format|
        format.html { redirect_to user_skills_path(@user), alert: 'Erreur lors de l\'ajout de la compétence.' }
        format.json { render json: { status: 'error', message: @user_skill.errors.full_messages } }
      end
    end
  end

  def edit
  end

  def update
    if @user_skill.update(user_skill_params)
      respond_to do |format|
        format.html { redirect_to user_skills_path(@user), notice: 'Compétence mise à jour avec succès.' }
        format.json { render json: { status: 'success', message: 'Compétence mise à jour' } }
      end
    else
      respond_to do |format|
        format.html { redirect_to user_skills_path(@user), alert: 'Erreur lors de la mise à jour.' }
        format.json { render json: { status: 'error', message: @user_skill.errors.full_messages } }
      end
    end
  end

  def destroy
    @user = @user_skill.user
    @user_skill.destroy

    respond_to do |format|
      format.html { redirect_to user_skills_path(@user), notice: 'Compétence supprimée avec succès.' }
      format.json { render json: { status: 'success', message: 'Compétence supprimée' } }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_skill
    @user_skill = UserSkill.find(params[:id])
  end

  def user_skill_params
    params.require(:user_skill).permit(:skill_id, :status)
  end
end
