# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @user = User.all
  end

  # GET /users/1
  def show; end

  # GET /users
  def new
    @user = User.new
  end

  # GET /users/new
  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  # GET /users/1/edit
  def edit
    set_user
  end

  # PATCH/PUT /users/1
  def update
    set_user
    if @user.update(user_params)
      redirect_to new_user_path
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |f|
      f.html do
        redirect_to users_url,
                    notice: 'User was successfully deleted.'
      end
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.required(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
