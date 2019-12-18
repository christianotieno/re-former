# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true
end
