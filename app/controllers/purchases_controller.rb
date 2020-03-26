class PurchasesController < ApplicationController
  def index
    @purchases = current_user.purchases.includes(:group, :creator).where.not(group_id: [nil]).order('name ASC')
    @total = current_user.purchases.sum('amount')
  end

  def show
  end
  
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(transaction_params)
    @purchase.author_id = current_user.id

    if @purchase.save
      flash[:success] = 'Your transaction has been added!!'
      redirect_to purchases_path
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:purchase).permit(:name, :amount, :group_id)
  end
end
