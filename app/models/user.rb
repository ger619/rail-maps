class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Roles for users
  enum role: %i[agent seller admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :agent
  end

  # Associations
  # has_many :properties
  # has_many :reviews
  # has_many :messages
  #  has_many :conversations, foreign_key: :sender_id
  #  has_many :conversations, foreign_key: :recipient_id
  #  has_many :notifications, foreign_key: :recipient_id

  # Validations
  #  validates :first_name, presence: true
  #  validates :last_name, presence: true
  #  validates :phone_number, presence: true
  #  validates :email, presence: true
  #   validates :password, presence: true

  # Methods
  #  def full_name
  #    "#{first_name} #{last_name}"
  #  end
end
