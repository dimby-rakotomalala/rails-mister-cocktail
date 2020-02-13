class Dose < ApplicationRecord
  DESCRIPTION = %w[ml cl dl l].freeze
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, :cocktail, :ingredient, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end
