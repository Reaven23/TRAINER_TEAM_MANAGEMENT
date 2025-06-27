class Team < ApplicationRecord
  # Relations
  has_many :team_memberships, dependent: :destroy
  has_many :users, through: :team_memberships

  # Validations
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: %w[U11 U13 U15 U18 U21 Seniors] }

  # Methods
  def players
    users.joins(:team_memberships).where(team_memberships: { role: 'player' })
  end

  def coaches
    users.joins(:team_memberships).where(team_memberships: { role: 'coach' })
  end

  def parents
    users.joins(:team_memberships).where(team_memberships: { role: 'parent' })
  end
end
