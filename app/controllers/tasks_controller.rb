# frozen_string_literal: true

# A controller to handle CRUD on Task
class TasksController < ProtectedController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  # rubocop:disable Metrics/MethodLength
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html do
          redirect_to @task, notice: I18n.t("task.create.task_successfully_created")
        end
        format.json { render show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html do
          redirect_to @task, notice: I18n.t("task.update.task_successfully_updated")
        end
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: task.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def destroy
    @task.delete
    respond_to do |format|
      format.html do
        redirect_to tasks_path, status: :see_other,
                                notice: I18n.t("task.destroy.task_successfully_deleted")
      end
      format.json { head :no_content }
    end
  end

  def set_task
    @task = Task.find(params.expect(:id))
  end

  # rubocop:disable Metrics/MethodLength
  def task_params
    filtered_params = params.expect(
      task: [
        :name,
        :description,
        { staff_groups: [] },
        { staff_users: [] }
      ]
    ).merge(user: current_user)

    filtered_params.each_key do |key|
      case key
      when "staff_groups", "staff_users"
        filtered_params[key].reject! { |element| element == "" }
        filtered_params[key].map! { |element| key.classify.constantize.find_by(element) }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
