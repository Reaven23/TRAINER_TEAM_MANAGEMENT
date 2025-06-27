class Skill < ApplicationRecord
  # Relations
  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills

  # Validations
  validates :name, presence: true
  validates :category, presence: true
  validates :age_group, presence: true, inclusion: { in: %w[U11 U13 U15 U18 U21 Seniors] }

  # Scopes
  scope :by_age_group, ->(age_group) { where(age_group: age_group) }
  scope :by_category, ->(category) { where(category: category) }

  # Categories possibles
  CATEGORIES = %w[U9 U11 U13 U15 U18 U21 SENIOR].freeze
end
