class User < ApplicationRecord
  has_secure_password

  enum :role, {
    citizen: 'citizen',
    responder: 'responder',
    coordinator: 'coordinator',
    administrator: 'administrator'
  }, default: 'citizen'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true, inclusion: { in: roles.keys }

  def active_for_authentication?
    active?
  end
end