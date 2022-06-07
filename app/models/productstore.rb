# frozen_string_literal: true
class Productstore < ApplicationRecord
  belongs_to :product
  belongs_to :store
end
