class Employee < ApplicationRecord
  has_many :interventions, foreign_key: "author"
  has_many :interventions, foreign_key: "employee_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable, 
         :timeoutable

  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{12,60}$/

    errors.add :password, 'Complexity requirement not met. Length should be 12-60 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
