class BillingInfo
  include ActiveModel::Model

  attr_accessor :zip, :country

  validates :zip, presence: true, length: { minimum: 5 }
end