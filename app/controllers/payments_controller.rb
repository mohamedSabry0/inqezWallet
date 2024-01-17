class PaymentsController < ApplicationController
  before_action :set_groups, only: %i[new create]
  before_action :set_def_group, only: %i[new create]
  def new
    @payment = current_user.payments.build
  end

  def create
    @payment = current_user.payments.build(payment_params)
    if @payment.save
      redirect_to group_path(@initial_group), notice: 'Payment was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Payment was not created.'
    end
  end

  private

  def set_groups
    @groups = current_user.groups
  end

  def set_def_group
    @initial_group = @groups.find_by(id: params[:def_group])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, group_ids: [])
  end
end
