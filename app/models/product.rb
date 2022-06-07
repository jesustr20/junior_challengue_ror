# frozen_string_literal: true
class Product < ApplicationRecord
  has_and_belongs_to_many :stores

  # Validations
  validates :name, uniqueness: true, presence: true
end
