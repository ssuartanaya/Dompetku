class UsersController < ApplicationController
  before_action :authenticate_user!
  def home
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @saldo = user.transactions
    saldo = user.transactions
    @last_saldo = saldo.last.nil? ? 0 : saldo.last.saldo
    @max = saldo.where(status: true).maximum("harga")
    @maxs = saldo.where(status: false).maximum("harga")
    respond_to do |format|
      format.html
    end
  end
  def show
      @user = User.find(params[:id])
      @transaction = current_user.transactions.build
      user = User.find(params[:id])
      saldo = user.transactions
      @last_saldo = saldo.last.nil? ? 0 : saldo.last.saldo
    end
end
