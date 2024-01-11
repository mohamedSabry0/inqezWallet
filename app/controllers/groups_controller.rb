class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = current_user.groups.includes(:payments).find(params[:id])
    @payments = @group.payments.order(created_at: :desc)
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new, notice: 'Group was not created.'
    end
  end

  private

  def group_params
    params.require(:group).permit(%i[name icon])
  end
end
