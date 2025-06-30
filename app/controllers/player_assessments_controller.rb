class PlayerAssessmentsController < ApplicationController
  before_action :set_user
  before_action :set_assessment, only: [:update]

  def new
    @assessment = @user.player_assessments.build
  end

  def create
    @assessment = @user.player_assessments.build(assessment_params)
    @assessment.assessment_date = Date.current

    if @assessment.save
      respond_to do |format|
        format.html { redirect_to profile_path(@user), notice: 'Bilan de compétences créé avec succès.' }
        format.json { render json: { status: 'success', message: 'Bilan créé' } }
      end
    else
      respond_to do |format|
        format.html { redirect_to profile_path(@user), alert: 'Erreur lors de la création du bilan.' }
        format.json { render json: { status: 'error', message: @assessment.errors.full_messages } }
      end
    end
  end

  def update
    if @assessment.update(assessment_params)
      respond_to do |format|
        format.html { redirect_to profile_path(@user), notice: 'Bilan de compétences mis à jour avec succès.' }
        format.json { render json: { status: 'success', message: 'Bilan mis à jour' } }
      end
    else
      respond_to do |format|
        format.html { redirect_to profile_path(@user), alert: 'Erreur lors de la mise à jour du bilan.' }
        format.json { render json: { status: 'error', message: @assessment.errors.full_messages } }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_assessment
    @assessment = @user.player_assessments.find(params[:id])
  end

  def assessment_params
    params.require(:player_assessment).permit(:key_skills, :areas_to_improve, :coach_notes)
  end
end
