class UserRegistrationForm
  
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :email, :string
  attribute :password, :string 
  attribute :password_confirmation, :string
  
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true}
  validate :email_is_not_taken_another
  validates :password, format: { with: /\A[\p{ascii}&&[^\x20]]{8,72}\z/ },
                       confirmation: { allow_blank: false } 
   
  def save
    return false if invalid?

    user.save
  end

  def user
    @user ||= User.new(email: email, password: password)
  end

  private

  def email_is_not_taken_another
    errors.add(:email, :taken, value: email) if User.exists?(email: email)
  end
end