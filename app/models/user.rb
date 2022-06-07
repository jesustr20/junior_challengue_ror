# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #enum rols: %i[client store]
  #after_initialize :set_default_rols, if: :new_record?
  #after_create :add_account_type
#
  has_one :client
  has_one :store
#
  #def set_default_rols
  #  self.rols ||= :client
  #end
#
  #def add_account_type
  #  if self.rols == 'client'
  #    Client.create(user_id: id)
  #  else
  #    Store.create(user_id: id, priority: 2)
  #  end
  #end
  
  #Validations
  validates :name, presence: true, length: { minimum:3 }
end
