# frozen_string_literal: true

# A controller for StaffGroup
class StaffGroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @staff_groups = StaffGroup.all
  end

  def show
    @staff_group = StaffGroup.find_by(id: params[:id])
  end

  def new
    @staff_group = StaffGroup.new
  end

  def edit; end

  def create
    @staff_group = StaffGroup.new(staff_group_params)
    if @staff_group.save
      redirect_to staff_group_path(@staff_group), notice: "Created #{@staff_group.name}."
    else
      flash[:alert] = I18n.t("resource_missing")
    end
  end

  def update; end

  def destroy
    @staff_group = StaffGroup.find_by(id: params[:id])
    if @staff_group.destroy
      redirect_to staff_groups_path, notice: "Deleted #{@staff_group.name}."
    else
      flash[:alert] = I18n.t("resource_missing")
    end
  end

  private

  def staff_group_params
    params.expect(staff_group: [:name])
  end
end
