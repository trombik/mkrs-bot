# frozen_string_literal: true

# A controller for StaffGroup
class StaffGroupsController < ProtectedController
  def index
    @staff_groups = StaffGroup.all
  end

  def show
    @staff_group = StaffGroup.find_by(id: params[:id])
  end

  def new
    @staff_group = StaffGroup.new
  end

  def edit
    @staff_group = StaffGroup.find(params[:id])
    render :index unless @staff_group
  end

  def create
    @staff_group = StaffGroup.new(staff_group_params)
    if @staff_group.save
      redirect_to staff_group_path(@staff_group), notice: "Created #{@staff_group.name}."
    else
      flash[:alert] = I18n.t("resource_missing")
    end
  end

  def update
    @staff_group = StaffGroup.find_by(id: params[:id])
    if @staff_group.update(staff_group_params)
      redirect_to @staff_group, notice: "Updated #{@staff_group.name}"
    else
      render :edit
    end
  end

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
