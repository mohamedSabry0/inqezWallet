class PaymentsController < ApplicationController
  before_action :set_groups
  def new
    @payment = current_user.payments.build
  end

  def create
    @payment = current_user.payments.build(payment_params)
    if @payment.save
      redirect_to groups_path, notice: 'Payment was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Payment was not created.'
    end
  end

  private

  def set_groups
    @groups = current_user.groups
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, group_ids: [])
  end
end
