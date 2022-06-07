# frozen_string_literal: true
class Store < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products
  has_many :requests
end
