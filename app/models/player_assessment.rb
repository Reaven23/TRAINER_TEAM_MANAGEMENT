class PlayerAssessment < ApplicationRecord
  belongs_to :user

  validates :key_skills, presence: true, length: { minimum: 10 }
  validates :areas_to_improve, presence: true, length: { minimum: 10 }
  validates :assessment_date, presence: true

  scope :recent, -> { order(assessment_date: :desc, created_at: :desc, id: :desc) }
  scope :for_user, ->(user) { where(user: user) }

  def self.latest_for_user(user)
    for_user(user).recent.first
  end

  def self.latest_for_user!(user)
    latest = latest_for_user(user)
    raise ActiveRecord::RecordNotFound, "Aucun bilan trouvé pour cet utilisateur" unless latest
    latest
  end
end
