# frozen_string_literal: true

class PurchasesController < ApplicationController
  def index
    @purchases = current_user.purchases.includes(:group).where.not(group_id: [nil]).order('name ASC')
    @total = current_user.purchases.where.not(group_id: [nil]).sum('amount')
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
      flash.now[:danger] = 'Please fill in all inputs'
      render :new
    end
  end

  private

  def transaction_params
    params.require(:purchase).permit(:name, :amount, :group_id)
  end
end
