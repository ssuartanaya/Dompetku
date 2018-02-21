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
      s = @transaction.harga.nil? ? 0 : @transaction.harga
      new_saldo = last_saldo - s
    else
      r = @transaction.harga.nil? ? 0 : @transaction.harga
      new_saldo = last_saldo + r
    end
    @transaction.saldo = new_saldo
    if @transaction.save
      sweetalert_success('Your transaction successfully created.', 'Successfully created', persistent: 'Okay!') 
      redirect_to user_path(current_user)
    else
      sweetalert_danger('Sorry transaction unsuccessful.', 'Sorry...', persistent: 'Dismiss!') 
      redirect_to user_path(current_user)
    end  
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    if @transaction.update(transaction_params)
      sweetalert_success('Your transaction successfully updated.', 'Successfully updated', persistent: 'Okay!') 
      redirect_to user_path(current_user)
    else
      format.html { render :edit }
      format.json { render json: @transaction.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    sweetalert_success('Your transaction successfully deleted.', 'Successfully deleted', persistent: 'Okay!') 
    redirect_to user_path(current_user)
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
