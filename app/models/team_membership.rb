class TeamMembership < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :team

  # Validations
  validates :role, presence: true, inclusion: { in: %w[player coach parent] }
  validates :user_id, uniqueness: { scope: [:team_id, :role], message: "est déjà assigné à ce rôle dans cette équipe" }

  # Scopes
  scope :players, -> { where(role: 'player') }
  scope :coaches, -> { where(role: 'coach') }
  scope :parents, -> { where(role: 'parent') }

  # Role constants
  ROLES = %w[player coach parent].freeze
end
