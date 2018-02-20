class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :js, :html, :json

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = User.find(params[:id])
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = current_user.transactions.build
    respond_with(@transaction)
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    transaction = current_user.transactions
    # last_transaction = transaction.last
    last_saldo = transaction.last.nil? ? 0 : transaction.last.saldo
    @transaction = transaction.build(transaction_params)
    if @transaction.status
      new_saldo = last_saldo - @transaction.harga
    else
      new_saldo = last_saldo + @transaction.harga      
    end
    @transaction.saldo = new_saldo

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to user_path(current_user), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to user_path(current_user), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:tgl, :uraian, :harga, :user_id, :status, :category_id)
    end
end
