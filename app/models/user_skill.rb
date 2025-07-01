class UserSkill < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :skill

  # Validations
  validates :status, presence: true, inclusion: { in: %w[Acquis Non_Acquis En_Progrès] }
  validates :user_id, uniqueness: { scope: :skill_id }

  # Callbacks
  before_validation :set_default_status, on: :create

  # Scopes
  scope :acquired, -> { where(status: 'Acquis') }
  scope :not_acquired, -> { where(status: 'Non_Acquis') }
  scope :in_progress, -> { where(status: 'En_Progrès') }
  scope :by_category, ->(category) { joins(:skill).where(skills: { category: category }) }

  # Status constants
  STATUSES = %w[Acquis Non_Acquis En_Progrès].freeze

  private

  def set_default_status
    self.status ||= 'Non_Acquis'
  end
end
