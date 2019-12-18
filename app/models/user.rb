# frozen_string_literal: true

class User < ApplicationRecord
  def setup
    @user = User.new(username: 'username', email: 'example@mail.com', password: 'password')
  end
end
