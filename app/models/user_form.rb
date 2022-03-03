class UserForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :user,
                :billing_country, :billing_zip, :billing_info,
                :emails

  validates :first_name, presence: true, length: { minimum: 5 }

  validate do
    @emails.each do |email|
      errors.add()
    end
  end

  validate do
    unless @user.valid?
      @user.errors[:first_name].each {|error| errors.add(:first_name, error) }
      @user.errors[:last_name].each {|error| errors.add(:last_name, error) }
    end

    unless @billing_info.valid?
      @billing_info.errors[:country].each {|error| errors.add(:billing_country, error) }
      @billing_info.errors[:zip].each {|error| errors.add(:billing_zip, error) }
    end
  end

  def setup_from(billing_info)
    @billing_country = billing_info[:country]
    @billing_zip = billing_info[:zip]
  end

  def save
    @billing_info ||= BillingInfo.new
    billing_info.country = @billing_country
    billing_info.zip = @billing_zip

    @user ||= User.new
    user.first_name = @first_name
    user.last_name = @last_name

    return unless valid?

    ApplicationRecord.transaction do
      billing_info.save
      user.save
    end
  end
end