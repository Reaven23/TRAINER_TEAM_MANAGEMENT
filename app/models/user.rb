class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  has_many :team_memberships, dependent: :destroy
  has_many :teams, through: :team_memberships
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  # Methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def player_teams
    teams.joins(:team_memberships).where(team_memberships: { role: 'player' })
  end

  def coach_teams
    teams.joins(:team_memberships).where(team_memberships: { role: 'coach' })
  end

  def parent_teams
    teams.joins(:team_memberships).where(team_memberships: { role: 'parent' })
  end
end
