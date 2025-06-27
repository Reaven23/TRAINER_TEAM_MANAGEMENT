class UserSkill < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :skill

  # Validations
  validates :status, presence: true, inclusion: { in: %w[Acquis Non_Acquis En_Progrès] }
  validates :user_id, uniqueness: { scope: :skill_id }

  # Scopes
  scope :acquired, -> { where(status: 'acquired') }
  scope :not_acquired, -> { where(status: 'not_acquired') }
  scope :in_progress, -> { where(status: 'in_progress') }
  scope :by_category, ->(category) { joins(:skill).where(skills: { category: category }) }

  # Status constants
  STATUSES = %w[acquired not_acquired in_progress].freeze
end
