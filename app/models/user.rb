# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
end
