class ClientTemplate < ApplicationRecord
  has_one :client, dependent: :destroy
  belongs_to :plan
  scope :active, -> {where(is_active: true)}
  scope :paid, -> {self.active.where(is_paid: true)}
  scope :free, -> {self.active.where(is_free: true)}
end
