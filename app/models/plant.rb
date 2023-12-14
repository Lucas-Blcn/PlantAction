class Plant < ApplicationRecord
  VALID_CATEGORIES = %w[grasse feuillue piquante ligneux herbacee vivace]
  belongs_to :user
  validates :category, presence: true, inclusion: { in: VALID_CATEGORIES }
  validates :price, presence: true, numericality: { only_integer: true }
end