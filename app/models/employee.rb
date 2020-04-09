class Employee < ApplicationRecord
  has_many :interventions, foreign_key: "author"
  has_many :interventions, foreign_key: "employee_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable
end
