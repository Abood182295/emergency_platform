class User < ApplicationRecord
<<<<<<< HEAD
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
=======
    has_secure_password
    validates :email, presence: true, uniqueness: true
  end
>>>>>>> 05edbb2529e47c264ecfe3a980c118e24c0ae272
