# frozen_string_literal: true
class Request < ApplicationRecord
  belongs_to :client
  belongs_to :store
  belongs_to :product
end
