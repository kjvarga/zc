class Login
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :email, :password

  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password
  validate :authenticate

  def initialize(attributes = nil)
    (attributes || {}).each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def authenticated?
    email == ENV['AUTH_EMAIL'] && Digest::SHA512.hexdigest(password) == ENV['AUTH_PASSWORD']
  end

  protected

  def authenticate
    errors[:base] << 'Invalid email or password.' if errors.empty? && !authenticated?
  end
end
