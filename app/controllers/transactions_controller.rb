class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to report_url(@transaction.report)
    else
      flash.now[:errors] = @transaction.errors.full_messages
      redirect_to report_url(@transaction.report)
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to report_url(@transaction.report)
    else
      flash.now[:errors] = @transaction.errors.full_messages
      render :edit
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to report_url(@transaction.report)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:report_id, :item, :cost, :transaction_date, :location)
  end
end
