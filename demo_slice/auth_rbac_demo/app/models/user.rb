require "uri"

class User < ApplicationRecord
  has_secure_password

  enum :role, { administrator: 0, coordinator: 1, responder: 2 }, validate: true

  before_validation :normalize_email
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
