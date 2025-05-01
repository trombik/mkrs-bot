# frozen_string_literal: true

# A controller for StaffGroup
class StaffGroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @staff_groups = StaffGroup.all
  end

  def show; end
  def update; end

  def destroy; end
end
