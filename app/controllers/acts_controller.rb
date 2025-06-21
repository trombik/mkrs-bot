# frozen_string_literal: true

# A controller to manage Act
class ActsController < ApplicationController
  before_action :set_act, only: [:show, :edit, :update, :destroy]

  # GET /acts or /acts.json
  def index
    @acts = Act.all
  end

  # GET /acts/1 or /acts/1.json
  def show; end

  # GET /acts/new
  def new
    @act = Act.new
  end

  # GET /acts/1/edit
  def edit; end

  # POST /acts or /acts.json
  def create
    @act = Act.new(act_params)

    respond_to do |format|
      if @act.save
        format.html { redirect_to @act, notice: I18n.t("act.act_successfully_created") }
        format.json { render :show, status: :created, location: @act }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acts/1 or /acts/1.json
  def update
    respond_to do |format|
      if @act.update(act_params)
        format.html { redirect_to @act, notice: I18n.t("act.act_successfully_updated") }
        format.json { render :show, status: :ok, location: @act }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acts/1 or /acts/1.json
  def destroy
    @act.destroy!

    respond_to do |format|
      format.html { redirect_to acts_path, status: :see_other, notice: I18n.t("act.act_successfully_deleted") }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_act
    @act = Act.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def act_params
    params.expect(act: [:name, :active, :description])
  end
end
