# frozen_string_literal: true

# A controller to handle StaffUser
class StaffUsersController < ProtectedController
  before_action :set_staff_user, only: [:show, :edit, :update, :destroy]

  # GET /staff_users or /staff_users.json
  def index
    @staff_users = StaffUser.all
  end

  # GET /staff_users/1 or /staff_users/1.json
  def show; end

  # GET /staff_users/new
  def new
    @staff_user = StaffUser.new
  end

  # GET /staff_users/1/edit
  def edit; end

  # POST /staff_users or /staff_users.json
  # rubocop:disable Metrics/MethodLength
  def create
    @staff_user = StaffUser.new(staff_user_params)

    respond_to do |format|
      if @staff_user.save
        format.html do
          redirect_to @staff_user, notice: I18n.t("staff_user.create.staff_user_successfully_created.content")
        end
        format.json { render :show, status: :created, location: @staff_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_users/1 or /staff_users/1.json
  def update
    respond_to do |format|
      if @staff_user.update(staff_user_params)
        format.html do
          redirect_to @staff_user, notice: I18n.t("staff_user.update.staff_user_successfully_updated.content")
        end
        format.json { render :show, status: :ok, location: @staff_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff_user.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # DELETE /staff_users/1 or /staff_users/1.json
  def destroy
    @staff_user.delete

    respond_to do |format|
      format.html do
        redirect_to staff_users_path, status: :see_other,
                                      notice: I18n.t("staff_user.destroy.staff_user_successfully_destroyed.content")
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_staff_user
    @staff_user = StaffUser.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def staff_user_params
    params.expect(staff_user: [:name, :account, :display_name, :active, { staff_group_ids: [] }])
  end
end
