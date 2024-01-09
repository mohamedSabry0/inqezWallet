class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = current_user.groups.find(params[:id])
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(%i[name icon])
  end
end
