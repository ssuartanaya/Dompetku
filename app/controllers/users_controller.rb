class UsersController < ApplicationController
  before_action :authenticate_user!
  def home
    @user = User.find(params[:id])
  end
  def show
      @user = User.find(params[:id])
      @transaction = current_user.transactions.build
    end
end
