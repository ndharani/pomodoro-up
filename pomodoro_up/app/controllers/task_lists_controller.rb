class TaskListsController < ApplicationController
  before_action :authorize
  before_action :task_status, only: [:show]

    # /task_lists
  def index
    @task_lists = current_user.task_lists
    @new_task_list = TaskList.new
  end

    # POST /task_lists
  def create
    task_list = TaskList.create(name: new_task_list_params[:name], user_id: current_user.id)
    if !task_list.valid?
      # TODO: bubble up errors
      puts "CREATE TASK LIST ERROR"
    end
    redirect_to task_lists_path
  end

    # /task_lists
  def show
    @task_list = TaskList.find_by(id: params[:id], user_id: current_user.id)
    if @task_list.nil?
      render "not_found"
      return
    end

    @active_tasks = @task_list.tasks.where.not(status: @deleted_task_status).all
    @new_task = @task_list.tasks.new
  end

  private

  def new_task_list_params
    params.require(:task_list).permit(:name)
  end
end
